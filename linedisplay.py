import numpy as np

from kivy.resources import resource_find
from kivy.graphics import Mesh, InstructionGroup, Color, Translate, PushMatrix, PopMatrix, ChangeState

from objloader import ObjFileLoader

nurbs = ObjFileLoader(resource_find('objects/line.obj'))

def make_mesh(m):
    return Mesh(
        vertices=m.vertices,
        indices=m.indices,
        fmt=m.vertex_format,
        mode='triangles'
    )

class Line(InstructionGroup):
    def __init__(self, x, y, color):
        super(Line, self).__init__()
        self.translate = Translate(x, y, 0)
        line = nurbs.objects['line']
        self.add(PushMatrix())
        self.add(self.translate)
        self.add(ChangeState(
            Kd=color,
            Ka=color,
            Ks=(0.3, 0.3, 0.3),
            Tr=1.0,
            Ns=1.0,
            intensity=0.8
        ))
        self.add(make_mesh(line))
        self.add(PopMatrix())

    def set_pos(self, x, y):
        self.translate.x = x
        self.translate.y = y
