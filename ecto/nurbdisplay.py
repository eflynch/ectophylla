import numpy as np

from kivy.graphics import Mesh, InstructionGroup, Color, Translate, PushMatrix, PopMatrix, Scale, ChangeState


class NurbDisplay(InstructionGroup):
    def __init__(self, nurb, pos, size=1.0, color=(0.0,1.0,0.0), tr=1.0, intensity=1.0):
        super(NurbDisplay, self).__init__()
        
        self.color = color
        self.tr = tr
        self.intensity = intensity

        self.translate = Translate()
        self.scale = Scale()
        self.color_instruction = InstructionGroup()

        self.add(PushMatrix())
        self.add(self.translate)
        self.add(self.scale)
        self.add(self.color_instruction)
        self.add(self.make_mesh(nurb))
        self.add(PopMatrix())

        self.set_color()
        self.set_size(size)
        self.set_pos(pos)

    def make_mesh(self, m):
        return Mesh(
            vertices=m.vertices,
            indices=m.indices,
            fmt=m.vertex_format,
            mode='triangles'
        )

    def set_size(self, size):
        self.scale.xyz = (size, size, size)

    def set_pos(self, pos):
        self.translate.xyz = pos

    def set_color(self, color=None, tr=None, intensity=None):
        if tr is not None:
            self.tr = tr
        if intensity is not None:
            self.intensity = intensity
        if color is not None:
            self.color = color

        self.color_instruction.clear()
        self.color_instruction.add(
            ChangeState(
                Kd=self.color,
                Ka=self.color,
                Ks=(0.3, 0.3, 0.3),
                Tr=self.tr,
                Ns=1.0,
                intensity=self.intensity
            )
        )

