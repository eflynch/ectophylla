from random import random
import bisect

import numpy as np

from kivy.logger import Logger
from kivy.uix.label import Label
from kivy.graphics import PushMatrix, PopMatrix, RenderContext, Callback, Color, ChangeState
from kivy.graphics import UpdateNormalMatrix, Translate, Rotate, Mesh, InstructionGroup, Scale
from kivy.graphics.transformation import Matrix
import kivy.graphics.opengl as gl

from kivy.clock import Clock as kivyClock
from kivy.resources import resource_find

from ecto.eran.core import run, BaseWidget
from ecto.objloader import ObjFileLoader
from ecto.note import Note
from ecto.notedisplay import NoteDisplay
from ecto.shapes import Sphere, Line, Plane
from ecto.config import config
import ecto.synth


class DisplayController(object):
    def __init__(self, width, height, canvas, ac, eye_pos, eye_angle):
        super(DisplayController, self).__init__()
        self.width = width
        self.height = height
        self.canvas = canvas
        self.eye_pos = eye_pos
        self.eye_angle = eye_angle
        self.ac = ac

        self.canvas.shader.source = resource_find('data/simple.glsl')

        self.all_notes = []
        self.visible_notes = {}
        self.ticks = []

        # self.planes = range(0, 10 * config['PLANE_SPACING'], config['PLANE_SPACING'])
        self.planes = []
        self.lines = []

        self.note_displays = InstructionGroup()
        self.plane_displays = InstructionGroup()
        self.line_displays = InstructionGroup()

        self.fixed_x = Translate(0, 0, 0)
        self.fixed_y = Translate(0, 0, 0)
        self.fixed_z = Translate(0, 0, 0)

        self.canvas.add(Callback(self.setup_gl_context))
        self.canvas.add(PushMatrix())
        self.canvas.add(UpdateNormalMatrix())

        self.canvas.add(self.note_displays)
        
        self.canvas.add(PushMatrix())
        self.canvas.add(self.fixed_z)
        self.canvas.add(self.line_displays)
        self.canvas.add(PopMatrix())

        self.canvas.add(PushMatrix())
        # self.canvas.add(self.fixed_x)
        # self.canvas.add(self.fixed_y)
        self.canvas.add(self.plane_displays)
        self.canvas.add(PopMatrix())

        # self.canvas.add(PushMatrix())
        # self.canvas.add(self.fixed_x)
        # self.canvas.add(self.fixed_y)
        # self.canvas.add(self.fixed_z)
        # self.canvas.add(Plane(-config['SELF_PLANE_DISTANCE'], size=0.1, color=(0x20/255., 0xD8/255., 0xE9/255.), tr=0.2))
        # self.canvas.add(PopMatrix())

        self.canvas.add(PopMatrix())
        self.canvas.add(Callback(self.reset_gl_context))

        self.draw_planes()

    def add_notes(self, note_data):
        s = config['LINE_SPACING']
        for nd in note_data:
            if (nd.x, nd.y) not in self.lines:
                self.line_displays.add(Line(nd.x * s, nd.y * s, color=(0.7, 0.5, 0.0)))
                self.lines.append((nd.x, nd.y))

        self.all_notes.extend(note_data)
        self.all_notes.sort(key=lambda n:n.tick)
        self.ticks = map(lambda n:n.tick, self.all_notes)

    def draw_planes(self):
        for p in self.planes:
            self.plane_displays.add(Plane(p, color=(0xE9/255., 0xD8/255., 0x3C/255.)))

    def setup_gl_context(self, *args):
        gl.glEnable(gl.GL_DEPTH_TEST)

    def reset_gl_context(self, *args):
        gl.glDisable(gl.GL_DEPTH_TEST)

    def get_look_at(self, x, y, z, azi, ele):
        dx = - np.sin(azi) * np.cos(ele)
        dy = np.sin(ele)
        dz = - np.cos(azi) * np.cos(ele)

        # Not sure why up has to just be up...
        upx, upy, upz = (0, 1, 0)

        mat = Matrix()
        mat = mat.look_at(x, y, z,
                          x + dx, y + dy, z + dz,
                          upx, upy, upz)
        return mat

    def update_camera(self, pos, angle):
        self.eye_pos = pos
        self.eye_angle = angle
        x, y, z = pos
        azi, ele = angle
        asp = self.width / float(self.height)
        mat = self.get_look_at(x, y, z, azi, ele)

        proj = Matrix()
        proj.perspective(30, asp, 1, 100)

        self.canvas['projection_mat'] = proj
        self.canvas['modelview_mat'] = mat

        self.fixed_x.x = x
        self.fixed_y.y = y
        self.fixed_z.z = z

    def get_notes_in_range(self, start_tick, end_tick):
      l = bisect.bisect_left(self.ticks, start_tick)
      r = bisect.bisect_left(self.ticks, end_tick)
      if r <= 0:
         return []
      return self.all_notes[l:r]

    def on_update(self, tick):
        self_plane_z = self.eye_pos[2] - config['SELF_PLANE_DISTANCE']

        eye_tick = tick + ( - self.eye_pos[2] / config['UNITS_PER_TICK'])

        in_range = self.get_notes_in_range(eye_tick - config['VISIBLE_TICK_RANGE'], eye_tick + config['VISIBLE_TICK_RANGE'])

        to_remove = []
        for nd in self.visible_notes:
            if nd not in in_range:
                to_remove.append(nd)

        for nd in to_remove:
            ndisp = self.visible_notes[nd]
            self.note_displays.remove(ndisp)
            del self.visible_notes[nd]
        
        for nd in in_range:
            if nd in self.visible_notes:
                continue

            ndisp = NoteDisplay(nd, self.planes, self.ac)
            self.note_displays.add(ndisp)
            self.visible_notes[nd] = ndisp

        for s in self.visible_notes.values():
            pos = s.pos_from_tick(tick)
            s.set_pos(pos)
            s.on_update(tick)

            if s.past_me and pos[2] < self_plane_z:
                s.past_me = False
            if pos[2] > self_plane_z and not s.past_me:
                s.sound(tick, pos)
                s.past_me = True


        Logger.debug('Number of notes: %s' % len(self.visible_notes))
