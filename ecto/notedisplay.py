from random import random

import numpy as np

from kivy.graphics import InstructionGroup
from kivy.core.image import Image as CoreImage
from kivy.clock import Clock as kivyClock

from ecto.shapes import Sphere, Diamond
from ecto.billboard import BillboardDisplay
import ecto.synth
from ecto.config import config

from ecto.yrange import Yrange

COLORS = ['red', 'orange', 'yellow', 'lightgreen', 'green', 'teal', 'lightblue', 'bluesteel', 'blue', 'pink', 'purple', 'burgundy']
textures = {}
for color in COLORS:
    for i in xrange(101):
        textures[(color, i)] = CoreImage("textures/%s%s.png" % (color, i)).texture

class SoundDisplay(InstructionGroup):
    def __init__(self, pos, exp_time, notedisp):
        super(SoundDisplay, self).__init__()
        self.exp_time = float(exp_time)
        self.time_elapsed = 0
        self.pos = pos
        self.notedisp = notedisp

        self.billboard = BillboardDisplay(pos, texture=textures[notedisp.texture_indices[0]], size_x=2.0, size_y=2.0)
        self.add(self.billboard)

    def on_update(self, dt, tick, angles):
        self.billboard.set_rotate(angles)
        self.time_elapsed += dt
        size = 2.0 + 1.0 * (self.time_elapsed / self.exp_time)
        self.billboard.set_size(size, size)
        self.billboard.set_color(Tr=1.0 - (self.time_elapsed / self.exp_time))

        return self.time_elapsed < self.exp_time


class NoteDisplay(InstructionGroup):
    def __init__(self, note_data, planes, ac):
        super(NoteDisplay, self).__init__()
        self.note = note_data
        self.planes = sorted(planes)
        self.ac = ac
        self.sound_count = 0
        self.past_me = False

        self.sounds = []
        self.sound_group = InstructionGroup()
        self.color = COLORS[self.note.pitch % 12]
        self.intensity = self.note.velocity

        self.texture_indices = [(self.color, i)  for i in range(100) +list(reversed(xrange(1,101)))]
        self.texture_frame = np.random.randint(len(self.texture_indices))
        self.billboard = BillboardDisplay(self.pos_from_tick(ac.tick), texture=textures[self.texture_indices[0]], size_x=2.0, size_y=2.0, intensity=self.intensity)
        self.add(self.sound_group)
        self.add(self.billboard)

    def pos_from_tick(self, tick):
        z = - (self.note.tick - tick) * config['UNITS_PER_TICK']
        x = config['LINE_SPACING'] * self.note.x
        y = config['LINE_SPACING'] * self.note.y
        return (x, y, z)

    def set_pos(self, pos):
        self.billboard.set_pos(pos)

    def sound(self, tick, pos):
        # Play Sound
        self.ac.play_note(tick, self.note, pos)

        # Render Sound
        exp_time = max(self.note.duration * 60 / (480 * self.ac.scheduler.cond.bpm), 0.2)
        sound_display = SoundDisplay(pos, exp_time, self)
        self.sounds.append(sound_display)
        self.sound_group.add(sound_display)

    def on_update(self, dt, tick, angles):
        self.texture_frame += 1
        self.billboard.set_texture(textures[self.texture_indices[int(self.texture_frame) % len(self.texture_indices)]])
        self.billboard.set_rotate(angles)
        for s in self.sounds:
            if not s.on_update(dt, tick, angles):
                self.sounds.remove(s)
                self.sound_group.remove(s)
            