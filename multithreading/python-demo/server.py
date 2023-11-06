from fastapi import FastAPI
from time import sleep


app = FastAPI()


@app.get("/square/{n}")
async def getter(n):
    sleep(0.1)
    return { "result": int(n) ** 2 }