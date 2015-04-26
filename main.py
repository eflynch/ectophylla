import numpy as np

LOG_LEVEL = 'info'

from kivy.config import Config
Config.set('kivy', 'log_level', LOG_LEVEL)
from kivy.graphics import RenderContext
from kivy.clock import Clock as kivyClock
from kivy.resources import resource_find

from eran.core import run, BaseWidget
from objloader import ObjFileLoader
from display import DisplayController
import synth


class MainWidget(BaseWidget):
    def __init__(self):
        super(MainWidget, self).__init__()
        self.canvas = RenderContext(compute_normal_mat=True)
        self.display = DisplayController(self.width, self.height, self.canvas)
        self.canvas = self.display.canvas
        self._touches = []
        self.eye_x = 0.
        self.eye_y = 0.
        self.eye_z = 0.
        self.eye_azimuth = 0.
        self.eye_elevation = 0.

    def update_camera(self):
        self.display.update_camera(self.eye_x, self.eye_y, self.eye_z,
                                   self.eye_azimuth, self.eye_elevation)

    def set_camera_pos(self, x, y, z):
        self.eye_x = x
        self.eye_y = y
        self.eye_z = z
        self.update_camera()
        synth.send_camera_pos(self.eye_x, self.eye_y, self.eye_z)

    def move_camera_pos(self, dx, dy, dz):
        self.set_camera_pos(self.eye_x + dx, self.eye_y + dy, self.eye_z + dz)

    def set_camera_angle(self, azi, ele):
        self.eye_azimuth = azi
        self.eye_elevation = ele
        self.rectify_angles()
        self.update_camera()
        synth.send_camera_angle(self.eye_azimuth * 180 / np.pi,
                                self.eye_elevation * 180 / np.pi)

    def move_camera_angle(self, dazi, dele):
        self.set_camera_angle(self.eye_azimuth + dazi, self.eye_elevation + dele)

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
        if touch in self._touches and touch.grab_current == self:
            if len(self._touches) == 1:
                dazi, dele = self.define_rotate_angle(touch)
                self.move_camera_angle(dazi, dele)


run(MainWidget)
