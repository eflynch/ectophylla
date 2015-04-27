import numpy as np

from kivy.resources import resource_find
from kivy.graphics import Mesh, InstructionGroup, Color, Translate, PushMatrix, PopMatrix

from objloader import ObjFileLoader

nurbs = ObjFileLoader(resource_find('objects/testnurbs.obj'))
print nurbs

def make_mesh(m):
    return Mesh(
        vertices=m.vertices,
        indices=m.indices,
        fmt=m.vertex_format,
        mode='triangles'
    )

class Sphere(InstructionGroup):
    def __init__(self, pos):
        super(Sphere, self).__init__()
        sphere = nurbs.objects['Sphere']
        self.translate = Translate(*pos)

        self.add(PushMatrix())
        self.add(self.translate)
        self.add(make_mesh(sphere))
        self.add(PopMatrix())

    def set_pos(self, pos):
        self.translate.xyz = pos
