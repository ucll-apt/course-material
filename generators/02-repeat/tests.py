from solution import repeat


def check(x):
    actual = repeat(x)

    for _ in range(1000):
        assert next(actual) == x


check(0)
check(1)
check('x')

print('Success!')
