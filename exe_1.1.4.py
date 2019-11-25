#!/usr/bin/env python3

from math import pi

class Cercle:
    def __init__(self, r):
        self.r = r

    def aire(self):
        return pi * self.r ** 2

    def perimetre(self):
        return 2 * pi * self.r
