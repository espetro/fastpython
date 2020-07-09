# Quim Terrasa 2020
# Computing test written in Python 3

def fib(n):
    a, b = 0, 1

    if n < 0:
        raise ValueError("The number has to be greater than 0")
    elif n == 0:
        return a
    elif n == 1:
        return b
    else:
        for i in range(2, n + 1):
            c = a + b
            a = b
            b = c
        return b

def _matmul(a, b):
    c = [[0, 0], [0, 0]]
    
    c[0][0] = a[0][0] * b[0][0] + a[0][1] * b[1][0]
    c[0][1] = a[0][0] * b[0][1] + a[0][1] * b[1][1]
    c[1][0] = a[1][0] * b[0][0] + a[1][1] * b[1][0]
    c[1][1] = a[1][0] * b[0][1] + a[1][1] * b[1][1]
    return c

def fib_matrix(n):
    """Computes the fibonacci number n using the matrix formula.

    Source:
        https://en.wikipedia.org/wiki/Fibonacci_number#Matrix_form
    """
    if n == 0:
        return 0
    elif n == 1:
        return 1
    elif n < 0:
        raise ValueError("The number has to be greater than 0")
    else:
        mat = [[1, 1], [1, 0]]
        result = mat
        for _ in range(n - 2):
            result = _matmul(result, mat)

        return abs(result[0][0])
        
    