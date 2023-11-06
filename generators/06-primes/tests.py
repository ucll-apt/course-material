from solution import primes
from itertools import islice


ps = list(islice(primes(), 100000))

assert ps[0] == 2
assert ps[99] == 541
assert ps[999] == 7919
assert ps[10000] == 104743
assert ps[99999] == 1299709

print('Success!')