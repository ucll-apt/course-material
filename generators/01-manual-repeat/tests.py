from solution import Repeat


def check(x):
    actual = Repeat(x)

    for _ in range(1000):
        item = next(actual)
        assert item == x, f'{item} != {x}'


check(0)
check(1)
check('x')

print('Success!')
