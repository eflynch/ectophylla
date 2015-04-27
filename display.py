from random import random

import numpy as np

from kivy.logger import Logger
from kivy.graphics import PushMatrix, PopMatrix, RenderContext, Callback, Color, ChangeState
from kivy.graphics import UpdateNormalMatrix, Translate, Rotate, Mesh, InstructionGroup, Scale
from kivy.graphics.transformation import Matrix
import kivy.graphics.opengl as gl

from kivy.clock import Clock as kivyClock
from kivy.resources import resource_find

from eran.core import run, BaseWidget
from objloader import ObjFileLoader
from note import Note
from notedisplay import NoteDisplay
from spheredisplay import Sphere
from linedisplay import Line
from planedisplay import Plane
import synth
from config import config


class DisplayController(object):
    def __init__(self, width, height, canvas, on_sound):
        super(DisplayController, self).__init__()
        self.canvas = canvas
        self.on_sound = on_sound
        self.width = width
        self.height = height
        self.canvas.shader.source = resource_find('simple.glsl')

        self.notes = []
        self.planes = range(-10 * config['PLANE_SPACING'], 10 * config['PLANE_SPACING'], config['PLANE_SPACING'])

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
        self.canvas.add(self.plane_displays)
        self.canvas.add(PopMatrix())

        self.canvas.add(PopMatrix())
        self.canvas.add(Callback(self.reset_gl_context))

        self.draw_lines()
        self.draw_planes()

    def add_notes(self, note_data):
        for sn in note_data:
            nd = NoteDisplay(sn, self.planes, self.on_sound)
            self.note_displays.add(nd)
            self.notes.append(nd)

    def draw_planes(self):
        for p in self.planes:
            self.plane_displays.add(Plane(p, (0xE9/255., 0xD8/255., 0x3C/255.)))

    def draw_lines(self):
        s = config['LINE_SPACING']
        for x in xrange(-5, 5):
            for y in xrange(-5, 5):
                self.line_displays.add(Line(x * s, y * s, (0.0, 0.0, 1.0)))

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

    def update_camera(self, x, y, z, azi, ele):
        asp = self.width / float(self.height)
        mat = self.get_look_at(x, y, z, azi, ele)

        proj = Matrix()
        proj.perspective(30, asp, 1, 100)

        self.canvas['projection_mat'] = proj
        self.canvas['modelview_mat'] = mat

        self.fixed_x.x = x
        self.fixed_y.y = y
        self.fixed_z.z = z


    def on_update(self, now_tick):
        for s in self.notes:
            continueFlag = s.on_update(now_tick)
            if not continueFlag:
                self.note_displays.remove(s)
                self.notes.remove(s)
