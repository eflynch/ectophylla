from nurbdisplay import NurbDisplay

class Plane(NurbDisplay):
    def __init__(self, z, color=(1.0,1.0,1.0), size=1.0, tr=0.5, intensity=0.5):
        super(Plane, self).__init__('objects/plane.obj', 'plane',
                                          (0, 0, z), size, color, tr, intensity)

class Line(NurbDisplay):
    def __init__(self, x, y, color=(1.0,1.0,1.0), size=1.0, tr=1.0, intensity=1.0):
        super(Line, self).__init__('objects/line.obj', 'line',
                                          (x, y, 0), size, color, tr, intensity)

class Sphere(NurbDisplay):
    def __init__(self, pos, color=(0.0, 1.0, 0.0), size=1.0, tr=1.0, intensity=0.7):
        super(Sphere, self).__init__('objects/testnurbs.obj', 'Sphere', pos, size, color, tr, intensity)

class Diamond(NurbDisplay):
    def __init__(self, pos, color=(0.0, 1.0, 0.0), size=1.0, tr=1.0, intensity=0.7):
        super(Diamond, self).__init__('objects/sound.obj', 'sound', pos, size, color, tr, intensity)
