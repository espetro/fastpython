! Quim Terrasa 2020
! Computing test written in FORTRAN95
! Compiled using SilverFrost Fortran95 (https://www.silverfrost.com/default.aspx?id=32)
! To test it, go to this folder and run:
!     ftn95 main.f95 /CHECKMATE
!     slink main.obj
!     main.exe (in Windows)
!     ./main (in Linux / Mac)

PROGRAM demo
    ! Compute the 5th fibonacci number
    INTEGER :: result, n
    n = 5
    result = fib_matrix(n)

    PRINT *, "hello world ", result

CONTAINS
    FUNCTION fib(n) RESULT(b)
        INTEGER :: n, a, b, c
        a = 0
        b = 1

        IF (n == 0) THEN
            b = a
        ELSE IF (n == 1) THEN
            b = b
        ELSE
            DO i = 2, n + 1
                c = a + b
                a = b
                b = c
            END DO
        END IF
    END FUNCTION

    FUNCTION fib_matrix(n) RESULT(res)
        INTEGER :: n, res
        INTEGER, DIMENSION(2,2) :: mat, tmp
        
        mat = reshape((/1, 1, 1, 0/), shape(mat))
        tmp = mat

        IF (n == 0) THEN
            res = 0
        ELSE IF (n == 1) THEN
            res = 1
        ELSE
            DO i = 0, n - 2
                tmp = matmul(tmp, mat)
            END DO
            res = tmp(1,1)
        END IF
    END FUNCTION
END PROGRAM demo
