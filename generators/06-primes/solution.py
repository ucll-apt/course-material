from itertools import count, takewhile

def primes():
    found = []
    for k in count(2):
        if not any(k % i == 0 for i in takewhile(lambda x: x * x <= k, found)):
            yield k
            found.append(k)

