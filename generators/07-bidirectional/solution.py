def counter():
    a, b = 0, 0
    while True:
        if (yield a, b):
            a += 1
        else:
            b += 1
