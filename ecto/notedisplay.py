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
for color in COLORS:
    map(lambda i: CoreImage("textures/%s%s.png" % (color, i)).texture, range(100))

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

        indices = range(100)
        self.textures = map(lambda i: CoreImage("textures/%s%s.png" % (self.color, i)).texture, indices)
        self.texture_frame = np.random.randint(len(self.textures))
        self.billboard = BillboardDisplay(self.pos_from_tick(ac.tick), texture=self.textures[0], size_x=2.0, size_y=2.0)
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
        self.billboard.set_texture(self.textures[int(self.texture_frame) % len(self.textures)])
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
