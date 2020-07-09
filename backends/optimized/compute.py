# Quim Terrasa 2020
# Computing test written in Python 3 + Numba JIT compiler

import numpy as np
import numba as nb

@nb.njit(cache=True)
def _fib(n):
    a, b = 0, 1
    if n == 0:
        return a
    elif n == 1:
        return b
    else:
        for i in range(2, n + 1):
            c = a + b
            a = b
            b = c
        return b

def fib(n):
    if n < 0:
        # Numba does not deal with error management
        raise ValueError("The number has to be greater than 0")
    return _fib(n)

@nb.njit(cache=True)
def _fib_matrix(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        mat = np.array([[1.0, 1.0], [1.0, 0.0]])
        result = mat
        for _ in range(n - 2):
            result = np.dot(result, mat)

        return abs(int(result[0,0]))  # debug why for fib_matrix(100) it returns a negative number

def fib_matrix(n):
    """Computes the fibonacci number n using the matrix formula.

    Source:
        https://en.wikipedia.org/wiki/Fibonacci_number#Matrix_form
    """
    if n < 0:
        # Numba does not deal with error management
        raise ValueError("The number has to be greater than 0")
    return _fib_matrix(n)
        
    