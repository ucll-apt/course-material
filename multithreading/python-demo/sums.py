from threading import Thread, Lock
from time import monotonic
import aiohttp
import requests
import asyncio


def square(n):
    response = requests.get(f'http://localhost:8000/square/{n}')
    return int(response.json()['result'])


async def async_square(session, n):
    async with session.get(f'http://localhost:8000/square/{n}') as response:
        return (await response.json())['result']


def benchmark(f):
    before = monotonic()
    result = f()
    after = monotonic()
    duration = after - before
    print(f'{result} ({duration})')


def sum_singlethreaded(a, b):
    return sum(square(k) for k in range(a, b))


def sum_using_threads(a, b):
    total = 0
    lock = Lock()

    def compute(k):
        def func():
            nonlocal total
            sqr = square(k)
            with lock:
                total += sqr
        return func

    threads = [Thread(target=compute(k)) for k in range(a, b)]

    for thread in threads:
        thread.start()

    for thread in threads:
        thread.join()

    return total


def sum_using_coroutines(a, b):
    async def aux():
        async with aiohttp.ClientSession() as session:
            tasks = [async_square(session, k) for k in range(a, b)]
            ks = await asyncio.gather(*tasks)
            return sum(ks)

    return asyncio.run(aux())


benchmark(lambda: sum_singlethreaded(1, 10))
benchmark(lambda: sum_using_threads(1, 10))
benchmark(lambda: sum_using_coroutines(1, 10))