import numpy as np

from kivy.resources import resource_find
from kivy.graphics import Mesh, InstructionGroup, Color, Translate, PushMatrix, PopMatrix, Scale, ChangeState

from objloader import ObjFileLoader

nurbs = ObjFileLoader(resource_find('objects/sound.obj'))

def make_mesh(m):
    return Mesh(
        vertices=m.vertices,
        indices=m.indices,
        fmt=m.vertex_format,
        mode='triangles'
    )

class SoundDisplay(InstructionGroup):
    def __init__(self, pos, size, color=(0.0,1.0,0.0)):
        super(SoundDisplay, self).__init__()
        sphere = nurbs.objects['sound']
        self.translate = Translate(*pos)
        self.scale = Scale(size)
        self.color_instruction = InstructionGroup()

        self.add(PushMatrix())
        self.add(self.translate)
        self.add(self.scale)
        self.add(self.color_instruction)
        self.add(make_mesh(sphere))
        self.add(PopMatrix())

        self.set_color(color)

    def set_pos(self, pos):
        self.translate.xyz = pos

    def set_color(self, color):
        self.color_instruction.clear()
        self.color_instruction.add(
            ChangeState(
                Kd=color,
                Ka=color,
                Ks=(0.3, 0.3, 0.3),
                Tr=0.5,
                Ns=1.0,
                intensity=0.7
            )
        )

