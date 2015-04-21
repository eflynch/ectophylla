import sys
sys.path.append('./common')
from core import *
from clock import *
from graphics import *

from kivy.uix.label import Label
from kivy.graphics.instructions import InstructionGroup
from kivy.graphics import Color, Ellipse, Line, Rectangle
from kivy.graphics import PushMatrix, PopMatrix, Translate, Scale, Rotate
from kivy.clock import Clock as kivyClock
from kivy.resources import resource_find

from rotation import SingleRotate
from objloader import ObjFileLoader

class MainWidget(BaseWidget):
	def __init__(self):
		super(MainWidget, self).__init__()
		self.canvas = RenderContext(compute_normal_mat=True)
		self.canvas.shader.source = resource_find('simple.glsl')
		self.scene = ObjFileLoader(resource_find("testnurbs.obj"))
		with self.canvas:
			self.cb = Callback(self.setup_gl_context)
			PushMatrix()
			self.setup_scene()
			PopMatrix()
			self.cb = Callback(self.reset_gl_context)
	        Clock.schedule_interval(self.update_scene, 1 / 60.)
	 	self._touches = []

	def setup_gl_context(self, *args):
		glEnable(GL_DEPTH_TEST)

	def reset_gl_context(self, *args):
	    glDisable(GL_DEPTH_TEST)

	def update_glsl(self, *largs):
	    asp = self.width / float(self.height)
	    proj = Matrix().view_clip(-asp, asp, -1, 1, 1, 100, 1)
	    self.canvas['projection_mat'] = proj

	def setup_scene(self):
	    Color(1, 1, 1, 0)

	    PushMatrix()
	    Translate(0, 0, -5)
	    # This Kivy native Rotation is used just for
	    # enabling rotation scene like trackball
	    self.rotx = Rotate(0, 1, 0, 0)
	    self.roty = Rotate(-120, 0, 1, 0) # here just rotate scene for best view
	    self.scale = Scale(1)
	            
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
	    _draw_element(sphere)

	def update_scene(self, *largs):
		self.update_glsl()
		pass
	# 	self.sphere

class AudioController(object):
	def __init__(self):
		super(AudioController, self).__init__()


class DisplayController(object):
	def __init__(self):
		super(DisplayController, self).__init__()