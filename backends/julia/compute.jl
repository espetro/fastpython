# Quim Terrasa 2020
# Computing test written in Julia 1.4

module Fibonacci
    # To import it from julia REPL, go to this directory and run:
    #   include("compute.jl")
    #   using .Fibonacci
    #   fib(5)
    #
    # To import it from Python REPL, go to this directory and run:
    #   from julia import Base
    #   from julia import Main
    #   Main.include("compute.jl")
    #   Main.Fibonacci.fib(5)

    function fib(n :: Int) :: Int # julia uses Haskell-style type declaration
        a, b = 0, 1
        if n == 0
            return a
        elseif n == 1
            return b
        else
            for i in 2:n
                c = a + b
                a = b
                b = c
            end
            return b
        end
    end

    function fib_matrix(n :: Int) :: Int
        # Computes the fibonacci number n using the matrix formula.
        if n == 0
            return 0
        elseif n == 1
            return 1
        elseif n < 0
            throw(DomainError("The number has to be greater than 0"))
        else
            mat = [1 1; 1 0]
            result = mat
            for _ in 0:(n - 3)
                result = result * mat
            end

            return abs(result[1,1])  # Index in julia starts from 1 instead of from 0
        end
    end

    export fib, fib_matrix
end