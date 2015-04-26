import liblo
import logging
import coloredlogs
import numpy as np

from eran.core import BaseWidget, run

from kivy.uix.label import Label
from kivy.graphics.instructions import InstructionGroup
from kivy.graphics import *
from kivy.graphics.transformation import Matrix
from kivy.graphics.opengl import *
from kivy.clock import Clock as kivyClock
from kivy.core.window import Window
from kivy.resources import resource_find

from objloader import ObjFileLoader
import synth

logger = logging.getLogger(__name__)
coloredlogs.install(level=logging.INFO)

OSC_OUT_PORT = 5555

addr = liblo.Address(OSC_OUT_PORT)

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
			kivyClock.schedule_interval(self.update_scene, 1 / 60.)
		self._touches = []
		self.eyex = 0.
		self.eyey = 0.
		self.eyez = 0.
		self.eye_azimuth = 0.
		self.eye_elevation = 0.
		assert(np.pi / 2 >= self.eye_azimuth >= - np.pi / 2)
		assert(np.pi > self.eye_azimuth >= -np.pi)


	def setup_gl_context(self, *args):
		glEnable(GL_DEPTH_TEST)

	def reset_gl_context(self, *args):
		glDisable(GL_DEPTH_TEST)

	def get_look_at(self):
		dx = - np.sin(self.eye_azimuth) * np.cos(self.eye_elevation)
		dy = np.sin(self.eye_elevation)
		dz = - np.cos(self.eye_azimuth) * np.cos(self.eye_elevation)

		# Not sure why up has to just be up...
		upx = 0
		upy = 1
		upz = 0

		mat = Matrix()
		mat = mat.look_at(self.eyex, self.eyey, self.eyez,
						  self.eyex + dx, self.eyey + dy, self.eyez + dz,
						  upx, upy, upz)
		return mat

	def update_glsl(self, *largs):
		asp = self.width / float(self.height)
		mat = self.get_look_at()

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

	def update_scene(self, *largs):
		self.update_glsl()
		# TODO: make the balls move

	def set_camera_pos(self, x, y, z):
		self.eyex = x
		self.eyey = y
		self.eyez = z
		synth.send_camera_pos(self.eyex, self.eyey, self.eyez)

	def move_camera_pos(self, dx, dy, dz):
		self.eyex += dx
		self.eyey += dy
		self.eyez += dz
		synth.send_camera_pos(self.eyex, self.eyey, self.eyez)

	def set_camera_angle(self, azi, ele):
		self.eye_azimuth = azi
		self.eye_elevation = ele
		self.rectify_angles()
		synth.send_camera_angle(self.eye_azimuth, self.eye_elevation)

	def move_camera_angle(self, dazi, dele):
		self.eye_azimuth += dazi
		self.eye_elevation += dele
		self.rectify_angles()
		synth.send_camera_angle(self.eye_azimuth, self.eye_elevation)

	def on_key_down(self, keycode, modifiers):
		SPEED = 0.2
		dy = dx = dz = dazi = dele = 0
		if keycode[1] == 'q': # up
			dy = -SPEED
		elif keycode[1] == 'e': # down
			dy = SPEED
		elif keycode[1] == 'd': # left strafe
			dz = - SPEED * np.sin(self.eye_azimuth)
			dx = SPEED * np.cos(self.eye_azimuth)
		elif keycode[1] == 'a': # right strafe
			dz = SPEED * np.sin(self.eye_azimuth)
			dx = - SPEED * np.cos(self.eye_azimuth)
		elif keycode[1] == 's': # backwards
			dz = SPEED * np.cos(self.eye_azimuth)
			dx = SPEED * np.sin(self.eye_azimuth)
		elif keycode[1] == 'w': # forwards
			dz = - SPEED * np.cos(self.eye_azimuth)
			dx = - SPEED * np.sin(self.eye_azimuth)

		elif keycode[1] == 'z':
			dazi = SPEED / 4
		elif keycode[1] == 'x':
			dazi = - SPEED / 4

		elif keycode[1] == 'v':
			dele = SPEED / 4
		elif keycode[1] == 'c':
			dele = - SPEED / 4

		self.move_camera_angle(dazi, dele)
		self.move_camera_pos(dx, dy, dz)

	def define_rotate_angle(self, touch):
		x_angle = - (touch.dx/self.width) * 2 * np.pi
		y_angle = (touch.dy/self.height) * np.pi
		return x_angle, y_angle

	def rectify_angles(self):
		if self.eye_azimuth >= np.pi:
			self.eye_azimuth -= 2 * np.pi
		elif self.eye_azimuth < - np.pi:
			self.eye_azimuth += 2 * np.pi

		if self.eye_elevation > np.pi / 2.0 :
			self.eye_elevation = np.pi / 2.0
		elif self. eye_elevation < - np.pi / 2.0:
			self.eye_elevation = - np.pi / 2.0

	def on_touch_down(self, touch):
		# print touch.profile.
		self._touch = touch
		touch.grab(self)
		self._touches.append(touch)

	def on_touch_up(self, touch): 
		touch.ungrab(self)
		self._touches.remove(touch)

	def on_touch_move(self, touch):
		self.update_glsl()

		if touch in self._touches and touch.grab_current == self:
			if len(self._touches) == 1:
				dazi, dele = self.define_rotate_angle(touch)
				self.move_camera_angle(dazi, dele)


class AudioController(object):
	def __init__(self):
		super(AudioController, self).__init__()


class DisplayController(object):
	def __init__(self):
		super(DisplayController, self).__init__()

run(MainWidget)
