from z3 import *

R_nums = [10,12,15,18,22,27,33,39,47,56,68,82]
R_pows = [1,10,100,1000,10000,100000]


R12 = Real("R12")
R14 = Real("R14")
K1 = Real("K1")

s = Solver()

R12_constraints = Or(R12 == 10, R12 == 12)
R14_constraints = Or(R14 == 10, R14 == 12)

for r_n in R_nums:
    for r_p in R_pows:
        R12_constraints = Or(R12_constraints, R12 == r_n * r_p)
        R14_constraints = Or(R14_constraints, R14 == r_n * r_p)


s.add(And(R12_constraints,R14_constraints))
s.add(And(K1 > 0.006, K1 < 0.017))
s.add(R12 == 3.3 / (K1 * 0.01))
s.add(And(R12/R14 > 1.297,R12/R14 < 1.456))

if s.check() == sat:
    m = s.model()
    print(m)
else:
    print("unsat")