import threading
import time


def run_without_locks(buffer_size, nthreads):
    buffer = [0] * buffer_size

    before = time.time()
    def proc():
        for i in range(len(buffer)):
            buffer[i] += 1

    threads = [threading.Thread(target=proc) for _ in range(nthreads)]

    for thread in threads:
        thread.start()

    for thread in threads:
        thread.join()

    after = time.time()

    duration = after - before
    error_count = sum(1 for x in buffer if x != nthreads)
    error_percentage = 100 * error_count / len(buffer)

    print(f"{nthreads} threads: {error_percentage}% errors, {duration}s")


buffer_size = 10000000
run_without_locks(buffer_size, 1)
run_without_locks(buffer_size, 5)
run_without_locks(buffer_size, 10)
