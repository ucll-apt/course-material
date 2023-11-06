def alternate(xs, ys):
    while True:
        yield next(xs)
        yield next(ys)
