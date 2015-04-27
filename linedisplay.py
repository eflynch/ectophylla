import numpy as np

from kivy.resources import resource_find
from kivy.graphics import Mesh, InstructionGroup, Color, Translate, PushMatrix, PopMatrix

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
    def __init__(self, x, y):
        super(Line, self).__init__()

        self.translate = Translate(x, y, 0)

        line = nurbs.objects['line']

        self.add(PushMatrix())
        self.add(self.translate)
        self.add(make_mesh(line))
        self.add(PopMatrix())

    def set_pos(self, pos):
        self.translate.xyz = pos
