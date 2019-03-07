from pycryptosat import Solver

s = Solver()
s.add_clauses([(1,), (1, -1)])
assert s.is_satisfiable()
s.add_clauses([(1,), (-1,)])
assert not s.is_satisfiable()
