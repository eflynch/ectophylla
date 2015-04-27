import numpy as np

from kivy.graphics import InstructionGroup

from spheredisplay import Sphere

class NoteDisplay(InstructionGroup):
    def __init__(self, note_data, planes):
        super(NoteDisplay, self).__init__()
        self.note = note_data
        self.planes = planes
        self.sound_count = 0

        units_per_minute = 0.08 * 3600
        ticks_per_minute = 80 * 480
        self.speed = units_per_minute / ticks_per_minute

        self.sphere = Sphere(self.compute_pos(), 0.3)
        self.add(self.sphere)

    def compute_pos(self, now_tick=0):
        z = self.planes[0] - (self.note.tp - now_tick) * self.speed
        x = 3 * self.note.x
        y = 3 * self.note.y
        return (x, y, z)

    def on_update(self, now_tick):
        x, y, z = self.compute_pos(now_tick)
        self.sphere.set_pos((x, y, z))

        if self.sound_count < len(self.planes):
            if z > self.planes[self.sound_count]:
                self.sound()
                self.sound_count += 1

    def sound(self):
        print 'Sounding'
