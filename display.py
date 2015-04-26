import numpy as np

from kivy.logger import Logger
from kivy.graphics import PushMatrix, PopMatrix, RenderContext, Callback
from kivy.graphics import UpdateNormalMatrix, Translate, Rotate, Mesh
from kivy.graphics.transformation import Matrix
import kivy.graphics.opengl as gl

from kivy.clock import Clock as kivyClock
from kivy.resources import resource_find

from eran.core import run, BaseWidget
from objloader import ObjFileLoader
import synth


class DisplayController(object):
    def __init__(self, width, height, canvas):
        super(DisplayController, self).__init__()
        self.canvas = canvas
        self.width = width
        self.height = height
        # self.canvas = RenderContext(compute_normal_mat=True)
        self.canvas.shader.source = resource_find('simple.glsl')
        self.scene = ObjFileLoader(resource_find("testnurbs.obj"))
        with self.canvas:
            self.cb = Callback(self.setup_gl_context)
            PushMatrix()
            self.setup_scene()
            PopMatrix()

    def setup_gl_context(self, *args):
        gl.glEnable(gl.GL_DEPTH_TEST)

    def reset_gl_context(self, *args):
        gl.glDisable(gl.GL_DEPTH_TEST)

    def get_look_at(self, x, y, z, azi, ele):
        dx = - np.sin(azi) * np.cos(ele)
        dy = np.sin(ele)
        dz = - np.cos(azi) * np.cos(ele)

        # Not sure why up has to just be up...
        upx = 0
        upy = 1
        upz = 0

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

    def setup_scene(self):
        PushMatrix()
        UpdateNormalMatrix()
        self.draw_elements()
        PopMatrix()

    def draw_elements(self):
        """ Draw separately all objects on the scene
            to setup separate rotation for each object
        """
        def _draw_element(m):
            Mesh(
                vertices=m.vertices,
                indices=m.indices,
                fmt=m.vertex_format,
                mode='triangles',
            )
        # Draw sphere in the center
        sphere = self.scene.objects['Sphere']
        self.sphere_trans = Translate(0, 0, -10)
        _draw_element(sphere)

        sphere2 = self.scene.objects['Sphere']
        self.sphere2_trans = Translate(0, 0, 10)
        _draw_element(sphere2)
