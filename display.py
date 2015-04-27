from random import random

import numpy as np

from kivy.logger import Logger
from kivy.graphics import PushMatrix, PopMatrix, RenderContext, Callback, Color
from kivy.graphics import UpdateNormalMatrix, Translate, Rotate, Mesh
from kivy.graphics.transformation import Matrix
import kivy.graphics.opengl as gl

from kivy.clock import Clock as kivyClock
from kivy.resources import resource_find

from eran.core import run, BaseWidget
from objloader import ObjFileLoader
from note_sphere import NoteSphere
from spheredisplay import Sphere
import synth
import score_parser


class DisplayController(object):
    def __init__(self, width, height, canvas):
        super(DisplayController, self).__init__()
        self.canvas = canvas
        self.width = width
        self.height = height
        self.canvas.shader.source = resource_find('simple.glsl')
        self.sphere_notes = score_parser.parse('score.txt')
        self.all_spheres = []

        self.canvas.add(Callback(self.setup_gl_context))
        self.canvas.add(Color(1, 1, 1, 0))
        self.canvas.add(PushMatrix())
        self.canvas.add(UpdateNormalMatrix())
        # self.sphere = Sphere((0, 0, -10))
        # self.canvas.add(self.sphere)
        self.draw_note_spheres()
        self.canvas.add(PopMatrix())
        self.canvas.add(Callback(self.reset_gl_context))

    def draw_note_spheres(self):
        for sn in self.sphere_notes:
            sphere = Sphere((0, 0, -3.*sn.tick))
            self.canvas.add(sphere)
            self.all_spheres.append(sphere)

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
        proj.perspective(30, asp, 1, 50)

        self.canvas['projection_mat'] = proj
        self.canvas['modelview_mat'] = mat
        self.canvas['diffuse_light'] = (1.0, 1.0, 0.0)
        self.canvas['ambient_light'] = (0.1, 0.1, 0.1)

    def on_update(self):
        for s in self.all_spheres:
            x, y, z = s.translate.xyz

            # x += 0.5 * (random() - 0.5)
            # y += 0.5 * (random() - 0.5)
            z += 0.01
            # * (random() - 0.5)

            s.set_pos((x, y, z))
