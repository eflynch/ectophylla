from random import random

import numpy as np

from kivy.graphics import InstructionGroup

from shapes import Sphere, Diamond
import synth
from config import config

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

        self.sphere = Sphere(self.pos_from_tick(ac.tick), size=0.3, intensity=0.7)
        self.add(self.sphere)
        self.add(self.sound_group)

    def pos_from_tick(self, tick):
        z = - (self.note.tp - tick) * self.note.speed
        x = config['LINE_SPACING'] * self.note.x
        y = config['LINE_SPACING'] * self.note.y
        return (x, y, z)

    def set_pos(self, pos):
        self.sphere.set_pos(pos)

    def sound(self, tick, pos):
        # Play Sound
        self.ac.play_note(tick, self.note, pos)

        # Render Sound
        color = (random(), random(), random())
        exp_tick = tick + self.note.duration
        sound_display = Diamond(pos, size=0.2, color=color, intensity=0.3)
        self.sounds.append((exp_tick, sound_display))
        self.sounds.sort()
        self.sound_group.add(sound_display)

        self.sphere.set_color(color)

    def on_update(self, tick):
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
