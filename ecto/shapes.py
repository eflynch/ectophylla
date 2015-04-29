from kivy.resources import resource_find

from ecto.objloader import ObjFileLoader

from ecto.nurbdisplay import NurbDisplay

# Important Optimization: Load the nurb files only once at startup
def get_nurb(filename, nurb_name):
    nurbs = ObjFileLoader(resource_find(filename))
    nurb = nurbs.objects[nurb_name]
    return nurb

plane = get_nurb('objects/plane.obj', 'plane')
line = get_nurb('objects/line.obj', 'line')
sphere = get_nurb('objects/testnurbs.obj', 'Sphere')
diamond = get_nurb('objects/diamond.obj', 'diamond')


class Plane(NurbDisplay):
    def __init__(self, z, color=(1.0,1.0,1.0), size=1.0, tr=0.5, intensity=0.5):
        super(Plane, self).__init__(plane, (0, 0, z), size, color, tr, intensity)

class Line(NurbDisplay):
    def __init__(self, x, y, color=(1.0,1.0,1.0), size=1.0, tr=1.0, intensity=1.0):
        super(Line, self).__init__(line, (x, y, 0), size, color, tr, intensity)

class Sphere(NurbDisplay):
    def __init__(self, pos, color=(0.0, 1.0, 0.0), size=1.0, tr=1.0, intensity=0.7):
        super(Sphere, self).__init__(sphere, pos, size, color, tr, intensity)

class Diamond(NurbDisplay):
    def __init__(self, pos, color=(0.0, 1.0, 0.0), size=1.0, tr=1.0, intensity=0.7):
        super(Diamond, self).__init__(diamond, pos, size, color, tr, intensity)
