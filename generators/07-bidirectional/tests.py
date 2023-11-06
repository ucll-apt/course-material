from solution import counter


c = counter()
assert next(c) == (0, 0)
assert c.send(True) == (1, 0)
assert c.send(True) == (2, 0)
assert c.send(False) == (2, 1)
assert c.send(False) == (2, 2)
assert c.send(False) == (2, 3)
assert c.send(True) == (3, 3)

print('Success!')