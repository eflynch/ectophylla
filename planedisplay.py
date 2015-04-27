import numpy as np

from kivy.resources import resource_find
from kivy.graphics import Mesh, InstructionGroup, Color, Translate, PushMatrix, PopMatrix, ChangeState

from objloader import ObjFileLoader

nurbs = ObjFileLoader(resource_find('objects/plane.obj'))

def make_mesh(m):
    return Mesh(
        vertices=m.vertices,
        indices=m.indices,
        fmt=m.vertex_format,
        mode='triangles'
    )

class Plane(InstructionGroup):
    def __init__(self, z, color):
        super(Plane, self).__init__()

        self.translate = Translate(0, 0, z)

        plane = nurbs.objects['plane']

        self.add(PushMatrix())
        self.add(self.translate)
        self.add(ChangeState(
            Kd=color,
            Ka=color,
            Ks=(0.3, 0.3, 0.3),
            Tr=0.5,
            Ns=1.0,
            intensity=0.5
        ))
        self.add(make_mesh(plane))
        self.add(PopMatrix())

    def set_pos(self, z):
        self.translate.z = z
