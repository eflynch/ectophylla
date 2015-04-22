import logging

import liblo
import coloredlogs

logger = logging.getLogger(__name__)
coloredlogs.install(level=logging.INFO)

#parameters
OSC_OUT_PORT = 5555

addr = liblo.Address(OSC_OUT_PORT)

def send_note(pitch, velocity, duration, start_pos, end_pos, time):
    logger.debug('Note (%s, %s, %s): %s --%s--> %s' % (pitch, velocity,
                duration, start_pos, time, end_pos))
    sx, sy, sz = start_pos
    ex, ey, ez = end_pos
    liblo.send(addr, '/note', pitch, velocity, duration,
               sx, sy, sz, ex, ey, ez, time)

def send_camera_pos(x, y, z):
    logger.debug('Camera Pos: %s %s %s' % (x, y, z))
    liblo.send(addr, '/camera/pos', x, y, z)

def send_camera_angle(azimuth, elevation):
    logger.debug('Camera Angle: %s %s' % (azimuth, elevation))
    liblo.send(addr, '/camera/angle', azimuth, elevation)

if __name__ == "__main__":
    send_camera_pos(5, 0, 1)
    send_camera_angle(0, 0)
    send_note(60, 1.0, 3000, (0, 0, 0), (10, 0, 0), 3300)
    send_note(57, 1.0, 3000, (10, 0, 0), (0, 0, 0), 3300)
