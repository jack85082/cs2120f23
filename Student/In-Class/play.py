from z3 import *

X = Real('x')
Y = Real('y')
s = Solver()
s.add(X**2 + Y**2 == 1)
if(s.check == sat):
    m = s.model()
else:
    print("unsat")