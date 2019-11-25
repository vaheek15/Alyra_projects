class CourbeElliptique:
    def __init__(self, a, b):
     self.a = a
     self.b = b
     if 4*a**3+27*b**2 == 0:
         raise ValueError('({}, {}) n\'est pas une courbe valide'.format(x, y))

    def __eq__(self, C):
        return (self.a, self.b) == (C.a, C.b)


    def testpoint(self, x,y):
        return y**2 == x**3 + self.a * x + self.b
        # print("{}, {} appartient à la courbe".format(x,y))


    def __str__(self):
        return 'y^2 = x^3 + {}x + {}'.format(self.a, self.b)



ec = CourbeElliptique(a=17,b=1)
print(ec)
