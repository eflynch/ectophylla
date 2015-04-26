from eran.core import *
from eran.clock import *
from eran.graphics import *

from kivy.uix.label import Label
from kivy.graphics.instructions import InstructionGroup
from kivy.graphics import *
from kivy.graphics.transformation import Matrix
from kivy.graphics.opengl import *
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
			kivyClock.schedule_interval(self.update_scene, 1 / 60.)
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
		self.sphere_trans.y += .01
		self.sphere_trans.x += .01
		self.sphere2_trans.y += .01
		self.sphere2_trans.x -= .01
		self.update_glsl()
		# self.sphere

	def on_key_down(self, keycode, modifiers):
		if keycode[1] == 'up':
			self.trans.y += .1
		elif keycode[1] == 'down':
			self.trans.y -= .1
		elif keycode[1] == 'left':
			self.trans.x += .1
		elif keycode[1] == 'right':
			self.trans.x -= .1
		elif keycode[1] == 'a':
			self.trans.z += .1
		elif keycode[1] == 's':
			self.trans.z -= .1
			
	def define_rotate_angle(self, touch):
		x_angle = (touch.dx/self.width)*360
		y_angle = -1*(touch.dy/self.height)*360
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

		# if 'button' in touch.profile:
			# print touch.button
			# print "hihihi"
		if touch in self._touches and touch.grab_current == self:
			if len(self._touches) == 1:
				# here do just rotation        
				ax, ay = self.define_rotate_angle(touch)
				
				self.roty.angle += ax
				self.rotx.angle += ay

			elif len(self._touches) == 2: # scaling here
				print "POOP"
				#use two touches to determine do we need scal
				touch1, touch2 = self._touches 
				old_pos1 = (touch1.x - touch1.dx, touch1.y - touch1.dy)
				old_pos2 = (touch2.x - touch2.dx, touch2.y - touch2.dy)
				
				old_dx = old_pos1[0] - old_pos2[0]
				old_dy = old_pos1[1] - old_pos2[1]
				
				old_distance = (old_dx*old_dx + old_dy*old_dy)
				
				new_dx = touch1.x - touch2.x
				new_dy = touch1.y - touch2.y
				
				new_distance = (new_dx*new_dx + new_dy*new_dy)
				
				SCALE_FACTOR = 0.01
				
				if new_distance > old_distance: 
					scale = SCALE_FACTOR
				elif new_distance == old_distance:
					scale = 0
				else:
					scale = -1*SCALE_FACTOR
					
				xyz = self.scale.xyz
				
				if scale:
					self.scale.xyz = tuple(p + scale for p in xyz)


class AudioController(object):
	def __init__(self):
		super(AudioController, self).__init__()


class DisplayController(object):
	def __init__(self):
		super(DisplayController, self).__init__()

run(MainWidget)