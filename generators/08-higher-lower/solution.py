def play():
    lower = 1
    upper = 100
    while True:
        guess = (upper + lower) // 2
        result = yield guess
        if result == 'higher':
            lower = guess + 1
        elif result == 'lower':
            upper = guess - 1
        else:
            return
