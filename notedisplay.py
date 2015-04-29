from random import random

import numpy as np

from kivy.graphics import InstructionGroup

from shapes import Sphere, Diamond
import synth
from config import config

class NoteDisplay(InstructionGroup):
    def __init__(self, note_data, planes, on_sound):
        super(NoteDisplay, self).__init__()
        self.note = note_data
        self.planes = sorted(planes)
        self.on_sound = on_sound
        self.sound_count = 0
        self.past_me = False

        self.sounds = []
        self.sound_group = InstructionGroup()

        self.sphere = Sphere(self.compute_pos(), size=0.3, intensity=0.7)
        self.add(self.sphere)
        self.add(self.sound_group)

    def compute_pos(self, now_tick=0):
        z = - (self.note.tp - now_tick) * self.note.speed
        x = config['LINE_SPACING'] * self.note.x
        y = config['LINE_SPACING'] * self.note.y
        return (x, y, z)

    def sound(self, now_tick):
        x, y, z = self.compute_pos(now_tick)
        color = (random(), random(), random())
        self.on_sound(self.note, (x, y, z))
        self.sphere.set_color(color)

        exp_t = now_tick + self.note.duration
        sound_display = Diamond((x, y, z), size=0.2, color=color, intensity=0.3)

        self.sounds.append((exp_t, sound_display))
        self.sounds.sort()
        
        self.sound_group.add(sound_display)


    def on_update(self, now_tick):
        x, y, z = self.compute_pos(now_tick)
        self.sphere.set_pos((x, y, z))

        while self.sounds:
            if self.sounds[0][0] > now_tick:
                break

            exp_t, s = self.sounds.pop(0)
            self.sound_group.remove(s)

        if self.sound_count < len(self.planes):
            if z > self.planes[self.sound_count]:
                self.sound(now_tick)
                self.sound_count += 1

        return z < 1000
