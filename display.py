from random import random

import numpy as np

from kivy.logger import Logger
from kivy.graphics import PushMatrix, PopMatrix, RenderContext, Callback, Color, ChangeState
from kivy.graphics import UpdateNormalMatrix, Translate, Rotate, Mesh
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


class DisplayController(object):
    def __init__(self, width, height, canvas, note_data, on_sound):
        super(DisplayController, self).__init__()
        self.canvas = canvas
        self.note_data = note_data
        self.on_sound = on_sound
        self.width = width
        self.height = height
        self.canvas.shader.source = resource_find('simple.glsl')
        self.all_spheres = []

        self.canvas.add(Callback(self.setup_gl_context))
        self.canvas.add(Color(1, 1, 1, 0))
        self.canvas.add(PushMatrix())
        self.canvas.add(UpdateNormalMatrix())
        self.draw_notes()
        self.add_lines()
        self.plane = Plane(-25, (0xE9/255., 0xD8/255., 0x3C/255.))
        self.canvas.add(self.plane)
        self.canvas.add(PopMatrix())
        self.canvas.add(Callback(self.reset_gl_context))

    def draw_notes(self):
        for sn in self.note_data:
            nd = NoteDisplay(sn, [-25], self.on_sound)
            self.canvas.add(nd)
            self.all_spheres.append(nd)

    def add_lines(self):
        for x in xrange(-5, 5):
            for y in xrange(-5, 5):
                self.canvas.add(Line(x * 3, y * 3, (0.0, 0.0, 1.0)))

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

    def on_update(self, now_tick):
        for s in self.all_spheres:
            s.on_update(now_tick)
