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

		upx = - np.sin(self.eye_azimuth) * np.sin(self.eye_elevation)
		upy = np.cos(self.eye_elevation)
		upz = - np.cos(self.eye_azimuth) * np.sin(self.eye_elevation)

		mat = Matrix()
		mat = mat.look_at(self.eyex, self.eyey, self.eyez,
						  self.eyex + dx, self.eyey + dy, self.eyez + dz,
						  upx, upy, upz)
		return mat

	def update_glsl(self, *largs):
		asp = self.height / float(self.width)
		mat = self.get_look_at()

		proj = Matrix()
		# proj.perspective(100, 1.0, 10, 100)
		proj = Matrix().view_clip(-asp, asp, -1, 1, 1, 100, 1)
		proj = proj.view_clip(-asp, asp, -.3, .3, 1, 100, 1)
		self.canvas['projection_mat'] = proj
		self.canvas['modelview_mat'] = mat
		# mat.normal_matrix()


	def setup_scene(self):
		Color(1, 1, 1, 0)

		PushMatrix()
		Translate(0, 0, -5)

		# self.rotx = Rotate(0, 1, 0, 0)
		# self.roty = Rotate(0, 0, 1, 0) # here just rotate scene for best view
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
		self.sphere_trans = Translate(0, 0, 0)
		_draw_element(sphere)

		sphere2 = self.scene.objects['Sphere']
		self.sphere2_trans = Translate(-1, -5, -1)
		_draw_element(sphere2)

	def update_scene(self, *largs):
		# self.sphere_trans.y += .01
		# self.sphere_trans.x += .01
		# self.sphere2_trans.y += .01
		# self.sphere2_trans.x -= .01
		self.update_glsl()
		# self.sphere

	def on_key_down(self, keycode, modifiers):
		if keycode[1] == 'q':
			self.eyey -= .1
		elif keycode[1] == 'e':
			self.eyey += .1
		elif keycode[1] == 'd':
			self.eyex += .1
		elif keycode[1] == 'a':
			self.eyex -= .1
		elif keycode[1] == 's':
			self.eyez += .1
		elif keycode[1] == 'w':
			self.eyez -= .1

	def on_update(self):
		PAN_SPEED = 0.01
		dt = kivyClock.frametime

		x, y = Window.mouse_pos
		if self.mousex is not None and self.mousey is not None:
			diffx = x - self.mousex
			diffy = y -self.mousey
			self.mousex = x
			self.mousey = y

			dazimuth = - PAN_SPEED * diffx
			delevation = PAN_SPEED * diffy

			self.eye_azimuth += dazimuth
			self.eye_elevation += delevation

			if self.eye_azimuth >= np.pi:
				self.eye_azimuth -= 2 * np.pi
			elif self.eye_azimuth < - np.pi:
				self.eye_azimuth += 2 * np.pi

			if self.eye_elevation > np.pi / 2.0 :
				self.eye_elevation = np.pi / 2.0
			elif self. eye_elevation < - np.pi / 2.0:
				self.eye_elevation = - np.pi / 2.0

		print self.eye_azimuth / np.pi , self.eye_elevation / np.pi

		self.mousex = x
		self.mousey = y

		self.update_glsl()

	# def define_rotate_angle(self, touch):
	# 	x_angle = (touch.dx/self.width)*360
	# 	y_angle = -1*(touch.dy/self.height)*360
	# 	return x_angle, y_angle

	# def on_touch_down(self, touch):
	# 	# print touch.profile.
	# 	self._touch = touch
	# 	touch.grab(self)
	# 	self._touches.append(touch)

	# def on_touch_up(self, touch): 
	# 	touch.ungrab(self)
	# 	self._touches.remove(touch)

	# def on_touch_move(self, touch):
	# 	self.update_glsl()


	# 	if touch in self._touches and touch.grab_current == self:
	# 		if len(self._touches) == 1:
	# 			# here do just rotation        
	# 			ax, ay = self.define_rotate_angle(touch)
	# 			self.centerx += ax
	# 			self.centery -= ay
	# 			# self.roty.angle += ax
	# 			# self.rotx.angle += ay

	# 		elif len(self._touches) == 2: 
	# 			touch1, touch2 = self._touches 
	# 			old_pos1 = (touch1.x - touch1.dx, touch1.y - touch1.dy)
	# 			old_pos2 = (touch2.x - touch2.dx, touch2.y - touch2.dy)
				
	# 			old_dx = old_pos1[0] - old_pos2[0]
	# 			old_dy = old_pos1[1] - old_pos2[1]
				
	# 			old_distance = (old_dx*old_dx + old_dy*old_dy)
				
	# 			new_dx = touch1.x - touch2.x
	# 			new_dy = touch1.y - touch2.y
				
	# 			new_distance = (new_dx*new_dx + new_dy*new_dy)
				
	# 			SCALE_FACTOR = 0.01
				
	# 			if new_distance > old_distance: 
	# 				scale = SCALE_FACTOR
	# 			elif new_distance == old_distance:
	# 				scale = 0
	# 			else:
	# 				scale = -1*SCALE_FACTOR
					
	# 			xyz = self.scale.xyz
				
	# 			if scale:
	# 				self.scale.xyz = tuple(p + scale for p in xyz)


class AudioController(object):
	def __init__(self):
		super(AudioController, self).__init__()


class DisplayController(object):
	def __init__(self):
		super(DisplayController, self).__init__()

run(MainWidget)