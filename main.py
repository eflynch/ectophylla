from random import randint, random
import numpy as np

LOG_LEVEL = 'info'

from kivy.config import Config
Config.set('kivy', 'log_level', LOG_LEVEL)
from kivy.graphics import RenderContext
from kivy.clock import Clock as kivyClock
from kivy.resources import resource_find

from eran.core import run, BaseWidget
from eran.clock import Clock, Conductor
from objloader import ObjFileLoader
from display import DisplayController
from note import Note
import synth
import score_parser
from config import config


class MainWidget(BaseWidget):
    def __init__(self):
        super(MainWidget, self).__init__()

        clock = Clock()
        self.conductor = Conductor(clock)
        self.eye_pos = (0., 0., 0.)
        self.eye_angle = (0., 0.)

        self.canvas = RenderContext(compute_normal_mat=True)
        self.display = DisplayController(self.width, self.height, self.canvas,
                                         self.on_sound, self.eye_pos, self.eye_angle)
        self.canvas = self.display.canvas
        self._touches = []
        self.update_camera()

    def update_camera(self):
        self.display.update_camera(self.eye_pos, self.eye_angle)

    def set_camera_pos(self, pos):
        self.eye_pos = pos
        self.update_camera()
        synth.send_camera_pos(*self.eye_pos)

    def move_camera_pos(self, dx, dy, dz):
        x, y, z = self.eye_pos
        self.set_camera_pos((x + dx, y + dy, z + dz))

    def set_camera_angle(self, angle):
        self.eye_angle = angle
        self.rectify_angle()
        self.update_camera()
        synth.send_camera_angle(self.eye_angle[0] * 180 / np.pi,
                                self.eye_angle[1] * 180 / np.pi)

    def move_camera_angle(self, dazi, dele):
        self.set_camera_angle((self.eye_angle[0] + dazi, self.eye_angle[1] + dele))

    def handle_camera(self, key):
        SPEED = 1.0
        dy = dx = dz = dazi = dele = 0
        if key == 'q': # up
            dy = -SPEED
        elif key == 'e': # down
            dy = SPEED
        elif key == 'd': # left strafe
            dz = - SPEED * np.sin(self.eye_angle[0])
            dx = SPEED * np.cos(self.eye_angle[0])
        elif key == 'a': # right strafe
            dz = SPEED * np.sin(self.eye_angle[0])
            dx = - SPEED * np.cos(self.eye_angle[0])
        elif key == 's': # backwards
            dz = SPEED * np.cos(self.eye_angle[0])
            dx = SPEED * np.sin(self.eye_angle[0])
        elif key == 'w': # forwards
            dz = - SPEED * np.cos(self.eye_angle[0])
            dx = - SPEED * np.sin(self.eye_angle[0])
        elif key == 'z':
            dazi = SPEED / 4
        elif key == 'x':
            dazi = - SPEED / 4
        elif key == 'v':
            dele = SPEED / 4
        elif key == 'c':
            dele = - SPEED / 4

        self.move_camera_angle(dazi, dele)
        self.move_camera_pos(dx, dy, dz)

    def on_key_down(self, keycode, modifiers):

        if keycode[1] in 'wasdqezxcv':
            self.handle_camera(keycode[1])

        elif keycode[1] == 'p':
            self.conductor.clock.toggle()

        elif keycode[1] == 'o':
            self.conductor.set_bpm(self.conductor.bpm * 1.05)

        elif keycode[1] == 'i':
            self.conductor.set_bpm(self.conductor.bpm * 0.95)

        elif keycode[1] == 'r':
            note_data = score_parser.parse('score.txt')
            self.display.add_notes(note_data)

        elif keycode[1] == 'spacebar':
            now_tick = self.conductor.get_tick()
            x = randint(-5, 5)
            y = randint(-5, 5)
            notes = []
            for i in xrange(10):
                n = Note(randint(48, 70), 1.0, 480 * randint(1, 5), x,
                         y, now_tick + randint(0, 480*20), 0.01 * random())
                notes.append(n)

            self.display.add_notes(notes)

        

    def define_rotate_angle(self, touch):
        x_angle = - (touch.dx/self.width) * 2 * np.pi
        y_angle = (touch.dy/self.height) * np.pi
        return x_angle, y_angle

    def rectify_angle(self):
        t, p = self.eye_angle
        if t >= np.pi:
            t -= 2 * np.pi
        elif t < - np.pi:
            t += 2 * np.pi

        if p > np.pi / 2.0 :
            p = np.pi / 2.0
        elif p < - np.pi / 2.0:
            p = - np.pi / 2.0

        self.eye_angle = (t, p)

    def on_touch_down(self, touch):
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

    def on_update(self):
        now_tick = self.conductor.get_tick()
        self.display.on_update(now_tick)

    def on_sound(self, note, pos):
        x, y, z = pos
        duration = note.duration * 60000 / (480 * self.conductor.bpm)
        start_pos = (x, y, z)
        end_pos = start_pos
        # end_pos = (x, y, z + (note.speed * note.duration) * 2)
        time = duration * 2

        synth.send_note(note.pitch, note.velocity, duration,
                        start_pos, end_pos, time)


run(MainWidget)
