class Note(object):
    def __init__(self, channel, pitch, velocity, duration, x, y, tick):
        self.channel = channel
        self.pitch = pitch
        self.velocity = velocity
        self.duration = duration
        self.x = x
        self.y = y
        self.tick = tick
