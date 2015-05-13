from random import random

import numpy as np

from kivy.graphics import InstructionGroup
from kivy.core.image import Image as CoreImage

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
        self.add(self.billboard)
        self.add(self.sound_group)

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
        exp_tick = tick + self.note.duration
        sound_display = Diamond(pos, size=0.2, color=(1,0,0), intensity=0.5)
        self.sounds.append((exp_tick, sound_display))
        self.sounds.sort()
        self.sound_group.add(sound_display)

    def on_update(self, tick, angles):
        self.texture_frame += 1
        self.billboard.set_texture(textures[self.texture_indices[int(self.texture_frame) % len(self.texture_indices)]])
        self.billboard.set_rotate(angles)
        while self.sounds:
            exp_tick, s = self.sounds[0]
            if exp_tick > tick:
                break
            exp_tick, s = self.sounds.pop(0)
            self.sound_group.remove(s)

        # if self.sound_count < len(self.planes):
        #     if z > self.planes[self.sound_count]:
        #         self.sound(now_tick)
        #         self.sound_count += 1
