"""Two threads print A and B in turn.

Two implementations, same contract: output must be exactly ABAB...AB.

  1. print_in_turn_condition  -- Condition + shared `turn` variable (recommended)
  2. print_in_turn_semaphore  -- two Semaphores passing a baton (kept for comparison)
"""

from __future__ import annotations

import threading

COUNT: int = 10


# ---------------------------------------------------------------- Condition way
def print_in_turn_condition(count: int = COUNT, first: str = 'A', second: str = 'B') -> None:
    """Alternate strictly using a Condition and a `turn` variable.

    `cond.wait_for(pred)` sleeps (no CPU burn) until the predicate holds, and
    re-checks it on every wake-up, so spurious wake-ups are handled for us.
    """
    cond = threading.Condition()
    turn = first

    def worker(char: str, other: str) -> None:
        nonlocal turn
        for i in range(count):
            with cond:
                cond.wait_for(lambda: turn == char)  # sleep until it is my turn
                print(f'{i + 1:02d}: {char}', flush=True)
                turn = other
                cond.notify()  # wake the only other thread

    threads = [
        threading.Thread(target=worker, args=(char, other), name=f'thread-{char}')
        for char, other in ((first, second), (second, first))
    ]
    for t in threads:
        t.start()
    for t in threads:
        t.join()


# ---------------------------------------------------------------- Semaphore way
def print_in_turn_semaphore(count: int = COUNT) -> None:
    """Alternate by passing a baton: each thread owns one Semaphore as its pass."""
    sem_a = threading.Semaphore(1)  # A goes first
    sem_b = threading.Semaphore(0)  # B must wait

    def worker(char: str, mine: threading.Semaphore, theirs: threading.Semaphore) -> None:
        for i in range(count):
            mine.acquire()  # blocking; do NOT use `with mine:` (it re-releases)
            print(f'{i + 1:02d}: {char}', flush=True)
            theirs.release()  # hand the baton over

    threads = [
        threading.Thread(target=worker, args=('A', sem_a, sem_b), name='thread-A'),
        threading.Thread(target=worker, args=('B', sem_b, sem_a), name='thread-B'),
    ]
    for t in threads:
        t.start()
    for t in threads:
        t.join()


if __name__ == '__main__':
    print('--- Condition ---')
    print_in_turn_condition()
    print('--- Semaphore ---')
    print_in_turn_semaphore()