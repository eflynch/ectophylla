import numpy as np

from kivy.graphics import Mesh, InstructionGroup, Color, Translate, Rotate, PushMatrix, PopMatrix, Scale, ChangeState
from kivy.resources import resource_find

from ecto.objloader import ObjFileLoader

nurbs = ObjFileLoader(resource_find('objects/rectangle.obj'))
rectangle_nurb = nurbs.objects['rectangle']


class BillboardDisplay(InstructionGroup):
    def __init__(self, pos, texture, size_x=1.0, size_y=1.0, intensity=1.0):
        super(BillboardDisplay, self).__init__()
        
        self.intensity = intensity

        self.translate = Translate()
        self.rotate_azi = Rotate(origin=(0,0,0), axis=(0,1,0))
        self.rotate_ele = Rotate(origin=(0,0,0), axis=(1,0,0))
        self.scale = Scale()
        self.color_instruction = InstructionGroup()
        self.mesh = Mesh(
            texture=texture,
            vertices=rectangle_nurb.vertices,
            indices=rectangle_nurb.indices,
            fmt=rectangle_nurb.vertex_format,
            mode='triangles'
        )

        self.add(PushMatrix())
        self.add(self.translate)
        self.add(self.rotate_azi)
        self.add(self.rotate_ele)
        self.add(self.scale)
        self.add(self.color_instruction)
        self.add(self.mesh)
        self.add(PopMatrix())

        self.set_color()
        self.set_size(size_x, size_y)
        self.set_pos(pos)
        self.set_texture(texture)

    def set_texture(self, texture):
        self.texture = texture
        self.mesh.texture = texture

    def set_rotate(self, angles):
        self.rotate_azi.angle = angles[0] * 180/np.pi
        self.rotate_ele.angle = angles[1] * 180/np.pi

    def set_size(self, size_x, size_y):
        self.scale.xyz = (size_x, size_y, 1)

    def set_pos(self, pos):
        self.translate.xyz = pos

    def set_color(self, intensity=1.0, Tr=1.0):
        self.color_instruction.clear()
        self.color_instruction.add(
            ChangeState(
                Kd=(1.0, 1.0, 1.0),
                Ka=(1.0, 1.0, 1.0),
                Ks=(1.0, 1.0, 1.0),
                Tr=Tr,
                Ns=1.0,
                intensity=intensity
            )
        )
