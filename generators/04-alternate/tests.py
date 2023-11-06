from solution import alternate
from itertools import count, repeat, cycle, islice



def check(xs, ys, expected):
    actual = alternate(iter(xs), iter(ys))

    for i, x, y in zip(count(), expected, actual):
        assert x == y, f"Error at position {i}: {x} != {y}"


check([1], [2], [1,2])
check([1,3,5,7], [2,4,6,8], [1,2,3,4,5,6,7,8])
check(count(), count(), [0,0,1,1,2,2,3,3,4,4,5,5])
check(repeat('x'), repeat('y'), islice(cycle('xy'), 1000))

print('Success!')
