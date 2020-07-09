// Quim Terrasa 2020
// Computing test written in C++ 17

/* To compile it, use LLVM/Clang, go to this folder and run:
 *     clang++ -std=c++17 -o main.exe compute.cpp
 *     g++ -std=c++17 -o main.exe compute.cpp
 *     (it should also work for gcc, but you are better off using g++. If you still want to use it, add the '-lstdc++' option)
 *
 *     main.exe (on Windows)
 *     ./main.exe (on Linux and Mac)
 * 
 * To use it from Python, run:
 *     g++ -std=c++17 -o compute.so -fPIC -shared compute.cpp
 * then call it from Python from 'compute.so'
 */

#include <iostream>
#include <vector>

typedef std::vector<std::vector<int>> v2d;

v2d matmul(v2d a, v2d b) {
    v2d c = {{0,0}, {0,0}};
    c[0][0] = a[0][0] * b[0][0] + a[0][1] * b[1][0];
    c[0][1] = a[0][0] * b[0][1] + a[0][1] * b[1][1];
    c[1][0] = a[1][0] * b[0][0] + a[1][1] * b[1][0];
    c[1][1] = a[1][0] * b[0][1] + a[1][1] * b[1][1];

    return c;
}

int fib(int n) {
    int a = 0, b = 1, c = -1;

    if (n < 0) {
        throw std::invalid_argument("The number has to be greater than 0");
    } else if (n == 0) {
        return a;
    } else if (n == 1) {
        return b;
    } else {
        for (int i=2; i <= n; i++) {
            c = a + b;
            a = b;
            b = c;
        }

        return abs(b);
    }
}

int fib_matrix(int n) {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else if (n < 0) {
        throw std::invalid_argument("The number has to be greater than 0");
    } else {
        v2d mat = {{1,1}, {1,0}};
        v2d result = mat;

        for (int i=0; i <= (n - 3); i++) {
            result = matmul(result, mat);
        }

        return abs(result[0][0]);
    }
}

int main() {
    int n = 5;

    std::cout << "Fibonacci number for n = " << n << " is " << fib_matrix(n) << std::endl;
}

extern "C" {
    extern int fib(int n) { return fib(n); }
    extern int fib_matrix(int n) { return fib_matrix(n); }
}