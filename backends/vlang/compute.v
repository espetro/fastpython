/* Quim Terrasa 2020
 * Computing test written in V / Vlang 0.1.28
 */
module compute

fn matmul(a []int, b []int) []int {
	// TODO: Language is not mature enough to have 2D arrays
	return []int{}
}

pub fn fib(n int) int {
	mut a, b, c := 0, 1, -1

    if n < 0 {
        return error("The number has to be greater than 0")
    } else if n == 0 {
        return a
    } else if n == 1 {
        return b
    } else {
		for _ in 2..n {
			c = a + b
            a = b
            b = c
		}

        return b
    }
}

pub fn fib_matrix(n int) ?int {
	if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else if n < 0 {
        return error("The number has to be greater than 0")
    } else {
		// TODO: Language is not mature enough to have 2D arrays
        // mut mat := [[1,1], [1,0]]
        // mut result := mat

		// for _ in 0..(n - 2) {
		// 	result = matmul(result, mat)
		// }

        // return result[0][0]
		return 10
    }
}
