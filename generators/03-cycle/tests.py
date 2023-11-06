from solution import cycle
from itertools import count

class ListIterable:
    def __init__(self, xs):
        self.__xs = xs

    def __iter__(self):
        return iter(self.__xs)


def check(xs, expected):
    actual = cycle(ListIterable(xs))

    for i, x, y in zip(count(), expected, actual):
        assert x == y, f"Error at position {i}"


check([1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
check([1, 2], [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2])
check([1, 2, 3], [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3])

print('Success!')
