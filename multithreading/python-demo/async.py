import asyncio
from asyncio.tasks import wait


async def foo(id):
    print(f"{id} 0")
    await asyncio.sleep(1)
    print(f"{id} 1")
    await asyncio.sleep(1)
    print(f"{id} 2")
    await asyncio.sleep(1)
    print(f"{id} 3")


tasks = [ foo(id) for id in 'abcd' ]
asyncio.run(asyncio.wait(tasks))