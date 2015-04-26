import liblo
import logging
import coloredlogs

from eran.core import *
from eran.clock import *
from eran.graphics import *

from kivy.uix.label import Label
from kivy.graphics.instructions import InstructionGroup
from kivy.graphics import *
from kivy.graphics.transformation import Matrix
from kivy.graphics.opengl import *
from kivy.clock import Clock as kivyClock
from kivy.core.window import Window
from kivy.resources import resource_find

from rotation import SingleRotate
from objloader import ObjFileLoader

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

		self.mousex = None
		self.mousey = None
		# self.camera_translate = [0, 0, -0.67]

	def setup_gl_context(self, *args):
		glEnable(GL_DEPTH_TEST)

	def reset_gl_context(self, *args):
		glDisable(GL_DEPTH_TEST)

	def get_look_at(self):
		dx = - np.sin(self.eye_azimuth) * np.cos(self.eye_elevation)
		dy = np.sin(self.eye_elevation)
		dz = - np.cos(self.eye_azimuth) * np.cos(self.eye_elevation)

		# upx = - np.sin(self.eye_azimuth) * np.sin(self.eye_elevation)
		# upy = np.cos(self.eye_elevation)
		# upz = - np.cos(self.eye_azimuth) * np.sin(self.eye_elevation)

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
		# mat.normal_matrix()


	def setup_scene(self):
		Color(1, 1, 0.2, 0)

		PushMatrix()
		self.scale = Scale(1)
		self.trans = Translate(0,0,0)
				
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
		self.sphere_trans = Translate(0, 0, -5)
		_draw_element(sphere)

		sphere2 = self.scene.objects['Sphere']
		self.sphere2_trans = Translate(0, 0, 5)
		_draw_element(sphere2)

	def update_scene(self, *largs):
		self.update_glsl()
		# TODO: make the balls move


	def on_key_down(self, keycode, modifiers):
		if keycode[1] == 'q': # up
			self.eyey -= .1
		elif keycode[1] == 'e': # down
			self.eyey += .1
		elif keycode[1] == 'd': # left strafe
			self.eyez += - 0.1 * np.sin(self.eye_azimuth)
			self.eyex += 0.1 * np.cos(self.eye_azimuth)
		elif keycode[1] == 'a': # right strafe
			self.eyez += 0.1 * np.sin(self.eye_azimuth)
			self.eyex += - 0.1 * np.cos(self.eye_azimuth)
		elif keycode[1] == 's': # backwards
			self.eyez += 0.1 * np.cos(self.eye_azimuth)
			self.eyex += 0.1 * np.sin(self.eye_azimuth)
		elif keycode[1] == 'w': # forwards
			self.eyez -= 0.1 * np.cos(self.eye_azimuth)
			self.eyex -= 0.1 * np.sin(self.eye_azimuth)

		elif keycode[1] == 'z':
			self.eye_azimuth += 0.1
		elif keycode[1] == 'x':
			self.eye_azimuth -= 0.1

		elif keycode[1] == 'v':
			self.eye_elevation += 0.1
		elif keycode[1] == 'c':
			self.eye_elevation -= 0.1

	def on_update(self):
		PAN_SPEED = 0.005
		dt = kivyClock.frametime

		self.update_glsl()

	def define_rotate_angle(self, touch):
		x_angle = - (touch.dx/self.width) * 2 * np.pi
		y_angle = (touch.dy/self.height) * np.pi
		return x_angle, y_angle

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
		self.send_camera_pos(self.eyex, self.eyey, self.eyez)
		self.send_camera_angle(self.eye_azimuth, self.eye_elevation)

	def send_note(self, pitch, velocity, duration, start_pos, end_pos, time):
		logger.debug('Note (%s, %s, %s): %s --%s--> %s' % (pitch, velocity,
				duration, start_pos, time, end_pos))
		sx, sy, sz = start_pos
		ex, ey, ez = end_pos
		liblo.send(addr, '/note', pitch, velocity, duration,
			   sx, sy, sz, ex, ey, ez, time)

	def send_camera_pos(self, x, y, z):
		logger.debug('Camera Pos: %s %s %s' % (x, y, z))
		liblo.send(addr, '/camera/pos', x, y, z)

	def send_camera_angle(self, azimuth, elevation):
		logger.debug('Camera Angle: %s %s' % (azimuth, elevation))
		liblo.send(addr, '/camera/angle', azimuth, elevation)

		if touch in self._touches and touch.grab_current == self:
			if len(self._touches) == 1:
				# here do just rotation        
				ax, ay = self.define_rotate_angle(touch)
				self.eye_azimuth += ax
				self.eye_elevation += ay

				if self.eye_azimuth >= np.pi:
					self.eye_azimuth -= 2 * np.pi
				elif self.eye_azimuth < - np.pi:
					self.eye_azimuth += 2 * np.pi

				if self.eye_elevation > np.pi / 2.0 :
					self.eye_elevation = np.pi / 2.0
				elif self. eye_elevation < - np.pi / 2.0:
					self.eye_elevation = - np.pi / 2.0


class AudioController(object):
	def __init__(self):
		super(AudioController, self).__init__()


class DisplayController(object):
	def __init__(self):
		super(DisplayController, self).__init__()

run(MainWidget)