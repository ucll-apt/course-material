from solution import merge_sorted
from itertools import count, repeat, islice


testcase = 1

def check(xs, ys, expected):
    global testcase
    print(f'Testing case #{testcase}')
    testcase += 1
    actual = merge_sorted(iter(xs), iter(ys))

    for i, x, y in zip(count(), expected, actual):
        assert x == y, f"Error at position {i}: {x} != {y}"


check([], [], [])
check([1], [], [1])
check([1], [1], [1, 1])
check([1], [2], [1, 2])
check([2], [1], [1, 2])
check([1, 3, 5], [2, 4, 6], [1, 2, 3, 4, 5, 6])
check(count(), count(), [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5])
check(count(), count(2), [0, 1, 2, 2, 3, 3, 4, 4, 5, 5])
check(repeat(1), repeat(2), islice(repeat(1), 10000))

print('Success!')
