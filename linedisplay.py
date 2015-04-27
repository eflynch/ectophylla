import numpy as np

from kivy.resources import resource_find
from kivy.graphics import Mesh, InstructionGroup, Color, Translate, PushMatrix, PopMatrix


class Line(InstructionGroup):
    def __init__(self, pos):
        super(Line, self).__init__()

        self.mesh = Mesh(
            vertices=vertices,
            indices=indices,
            fmt=vertex_format,
            mode='triangles'
        )
        self.translate = Translate(*pos)

        self.add(PushMatrix())
        self.add(self.translate)
        self.add(make_mesh(sphere))
        self.add(PopMatrix())

    def set_pos(self, pos):
        self.translate.xyz = pos
