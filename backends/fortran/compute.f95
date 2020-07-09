! Quim Terrasa 2020
! Computing test written in FORTRAN95
! Guide: https://www.numfys.net/howto/F2PY/

subroutine fib(n, out)
! =========================
! Compute the n-th fibonacci number.
! Returns the result in the 'out' variable.
! =========================
    implicit none
    integer, intent(in)  :: n
    integer, intent(out) :: out
    integer :: a, b, c, i
    a = 0
    b = 1

    if (n == 0) then
        out = 0
    else if (n == 1) then
        out = 1
    else
        do i = 2, n
            c = a + b
            a = b
            b = c
        end do
        out = abs(b)
    end if
end subroutine

subroutine fib_matrix(n, out)
! =========================
! Compute the n-th fibonacci number using the matrix formula
! Source: https://en.wikipedia.org/wiki/Fibonacci_number#Matrix_form
!
! Returns the result in the 'out' variable.
! =========================
    implicit none
    integer, intent(in)  :: n
    integer, intent(out) :: out
    integer, dimension(2,2) :: mat, tmp
    integer :: i
    
    mat = reshape((/1, 1, 1, 0/), shape(mat))
    tmp = mat

    if (n == 0) then
        out = 0
    else if (n == 1) then
        out = 1
    else
        do i = 0, n - 3
            tmp = matmul(tmp, mat)
        end do 
        out = abs(tmp(1,1))
    end if
end subroutine
