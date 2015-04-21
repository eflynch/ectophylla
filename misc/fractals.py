import numpy as np
from matplotlib.pyplot import get_cmap

from kivy.uix.label import Label
from kivy.graphics.instructions import InstructionGroup
from kivy.graphics import Color, Ellipse, Line, Rectangle, Mesh
from kivy.graphics.texture import Texture
from kivy.graphics import PushMatrix, PopMatrix, Translate, Scale, Rotate
from kivy.clock import Clock as kivyClock

from common.core import BaseWidget, run

ITERATIONS = 1000


def affine(a, b, c, d, e, f):
    def fun(x, y):
        return a * x + b * y + e, c * x + d * y + f
    return fun

class MainWidget(BaseWidget):
    def __init__(self):
        super(MainWidget, self).__init__()
        self.affines = [
            affine(0, 0, 0, 0.16, 0, 0),
            affine(0.85, 0.04, -0.04, 0.85, 0, 1.60),
            affine(0.20, -0.26, 0.23, 0.22, 0, 1.60),
            affine(-0.15, 0.28, 0.26, 0.24, 0, 0.44)
        ]
        self.probs = [
            0.01,
            0.85,
            0.07,
            0.07
        ]
        self.x = 0
        self.y = 0
        self.canvas.add(Color(1.0, 1.0, 1.0))

        for i in xrange(ITERATIONS):
            x, y = self.iterate()
            self.canvas.add(Ellipse(pos=(x*50 + 400, y*50 + 20), size=(1,1)))

    def iterate(self):
        pick = np.random.random()
        accu = 0
        for p, a in zip(self.probs, self.affines):
            accu += p
            if pick < accu:
                self.x, self.y = a(self.x, self.y)
                return self.x, self.y

    def on_update(self):
        pass

class MainWidget2(BaseWidget):
    def __init__(self):
        super(MainWidget2, self).__init__()
        self.state = (0., 0., 1., 0.)
        self.canvas.add(Color(1.0, 1.0, 1.0))

        for i in xrange(ITERATIONS):
            x, y, r, theta = self.iterate()
            x2 = x + r * np.cos(theta)
            y2 = y + r * np.sin(theta)
            points = [x * 300 + 100, y * 300 + 100, x2 * 300 + 100, y2 * 300 + 100]
            self.canvas.add(Line(points=points, width=1))

    def iterate(self):
        x, y, r, theta = self.state
        new_x = x + r * np.cos(theta)
        new_y = y + r * np.sin(theta)
        new_r = r * 0.99
        new_theta = theta + 2.5
        self.state = (new_x, new_y, new_r, new_theta)
        return self.state

    def on_update(self):
        pass

cmap = get_cmap('gist_rainbow')

class MainWidget3(BaseWidget):
    def __init__(self):
        super(MainWidget3, self).__init__()
        self.state = (0., 0., 1., 0.)
        self.w = 200
        self.h = 100
        self.max_iterations = 1000
        self.sw = np.array([-2.5, -1.])
        self.dim = np.array([3.5, 2.0])
        self.texture =  Texture.create(size=(self.w, self.h))
        self.set_buffer(self.sw, self.dim)
        self.rect = Rectangle(texture=self.texture, pos=(0,0), size=(self.w, self.h))
        self.canvas.add(self.rect)

    def set_buffer(self, sw, size):
        buf = []
        for i in xrange(self.w * self.h):
            wx = i % self.w
            wy = (i - wx) / self.w
            x0 = wx * size[0] / self.w + sw[0]
            y0 = wy * size[1] / self.h + sw[1]
            x, y = 0, 0
            iteration = 0
            while ( x ** 2 + y ** 2 < 2 ** 2 and iteration < self.max_iterations):
                xtemp = x * x - y * y + x0
                y = 2 * x * y + y0
                x = xtemp
                iteration += 1

            color = cmap(iteration * 255 / self.max_iterations)[:3]
            buf.append(int(color[0] * 255))
            buf.append(int(color[1] * 255))
            buf.append(int(color[2] * 255))
        buf = b''.join(map(chr, buf))
        self.texture.blit_buffer(buf, colorfmt='rgb', bufferfmt='ubyte')
        self.canvas.ask_update()

    def on_key_down(self, keycode, modifiers):
        if keycode[1] == 'e':
            center = self.sw + self.dim / 2.0
            self.dim *= 0.9
            self.sw = center - (self.dim / 2.0)
            self.set_buffer(self.sw, self.dim)

        if keycode[1] == 'q':
            center = self.sw + self.dim / 2.0
            self.dim /= 0.9
            self.sw = center - (self.dim / 2.0)
            self.set_buffer(self.sw, self.dim)

        if keycode[1] == 'a':
            center = self.sw + self.dim / 2.0 - (np.array([-0.05, 0.0]) * self.dim)
            self.sw = center - (self.dim / 2.0)
            self.set_buffer(self.sw, self.dim)

        if keycode[1] == 'd':
            center = self.sw + self.dim / 2.0 - (np.array([0.05, 0.0]) * self.dim)
            self.sw = center - (self.dim / 2.0)
            self.set_buffer(self.sw, self.dim)

        if keycode[1] == 's':
            center = self.sw + self.dim / 2.0 - (np.array([0.0, -0.05]) * self.dim)
            self.sw = center - (self.dim / 2.0)
            self.set_buffer(self.sw, self.dim)

        if keycode[1] == 'w':
            center = self.sw + self.dim / 2.0 - (np.array([0.0, 0.05]) * self.dim)
            self.sw = center - (self.dim / 2.0)
            self.set_buffer(self.sw, self.dim)


run(MainWidget3)