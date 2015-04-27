import liblo

from kivy.logger import Logger
from config import config

#parameters
OSC_OUT_PORT = config['OSC_OUT_PORT'] 

addr = liblo.Address(OSC_OUT_PORT)
SCALE_FACTOR = 1 / config['UNITS_PER_METER']

def send_note(pitch, velocity, duration, start_pos, end_pos, time):
    Logger.debug('Note (%s, %s, %s): %s --%s--> %s' % (pitch, velocity,
                duration, start_pos, time, end_pos))
    sx, sy, sz = (i * SCALE_FACTOR for i in start_pos)
    ex, ey, ez = (i * SCALE_FACTOR for i in end_pos)
    liblo.send(addr, '/note', pitch, velocity, duration,
               sx, sy, sz, ex, ey, ez, time)

def send_camera_pos(x, y, z):
    Logger.debug('Camera Pos: %s %s %s' % (x, y, z))
    liblo.send(addr, '/camera/pos', x * SCALE_FACTOR, y * SCALE_FACTOR, z * SCALE_FACTOR)

def send_camera_angle(azimuth, elevation):
    Logger.debug('Camera Angle: %s %s' % (azimuth, elevation))
    liblo.send(addr, '/camera/angle', azimuth, elevation)

if __name__ == "__main__":
    send_camera_pos(0, 0, 1)
    send_camera_angle(0, 0)
    # send_note(60, 1.0, 3000, (16, 0, 0), (18, 0, 0), 3300)
    # send_note(57, 1.0, 3000, (10, 0, 0), (0, 0, 0), 3300)
