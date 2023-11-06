def merge_sorted(xs, ys):
    sentinel = object()

    def add_sentinel(xs):
        yield from xs
        yield sentinel

    xs = add_sentinel(xs)
    ys = add_sentinel(ys)

    x = next(xs)
    y = next(ys)

    while x is not sentinel and y is not sentinel:
        if x < y:
            yield x
            x = next(xs)
        else:
            yield y
            y = next(ys)

    if x is not sentinel:
        yield x

    if y is not sentinel:
        yield y

    yield from xs
    yield from ys
