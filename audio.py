from eran.clock import Clock, Conductor, Scheduler

import synth

class AudioController(object):
    def __init__(self):
        super(AudioController, self).__init__()
        clock = Clock()
        cond = Conductor(clock)
        self.scheduler = Scheduler(cond)

    def toggle(self):
        self.scheduler.cond.clock.toggle()

    def play_note(self, tick, note, pos):
        self.scheduler.post_at_tick(tick, self.synth_play, (note, pos))

    def synth_play(self, tick, arg):
        note, pos = arg
        x, y, z = pos
        duration = note.duration * 60000 / (480 * self.scheduler.cond.bpm)
        start_pos = (x, y, z)
        end_pos = start_pos
        # end_pos = (x, y, z + (note.speed * note.duration) * 2)
        time = duration * 2

        synth.send_note(note.pitch, note.velocity, duration,
                        start_pos, end_pos, time)

    @property
    def bpm(self):
        return self.scheduler.cond.bpm

    @bpm.setter
    def bpm(self, value):
        self.scheduler.cond.set_bpm(value)

    @property
    def tick(self):
        return self.scheduler.cond.get_tick()
    
    