import numpy as np

from kivy.graphics import InstructionGroup

from spheredisplay import Sphere

class NoteDisplay(InstructionGroup):
    def __init__(self, note_data):
        super(NoteDisplay, self).__init__()
        self.note = note_data

        units_per_minute = 0.08 * 3600
        ticks_per_minute = 80 * 480
        self.speed = units_per_minute / ticks_per_minute

        self.sphere = Sphere(self.compute_pos(), 0.3)
        self.add(self.sphere)

    def compute_pos(self, now_tick=0):
        z = (-25) - (self.note.tp - now_tick) * self.speed
        x = 3 * self.note.x
        y = 3 * self.note.y
        return (x, y, z)

    def on_update(self, now_tick):
        self.sphere.set_pos(self.compute_pos(now_tick))
