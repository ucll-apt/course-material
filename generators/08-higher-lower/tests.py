from solution import play

for secret_number in range(1, 100):
    ai = play()
    tries = 0
    guess = next(ai)
    while guess != secret_number:
        if guess < secret_number:
            guess = ai.send('higher')
        else:
            guess = ai.send('lower')
        tries += 1
    assert tries <= 6


print('Success!')
