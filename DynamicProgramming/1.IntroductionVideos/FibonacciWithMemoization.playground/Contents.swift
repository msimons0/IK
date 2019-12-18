var memo:[Int] = []

func fibonacci(n: Int) -> Int {
    if memo[n] != -1 {
        return memo[n]
    } else {
        memo[n] = fibonacci(n: n-1) + fibonacci(n: n-2)
        return memo[n]
    }
}

func fibonacciHelper(n: Int) {
    memo = [Int](repeating: -1, count: n)
    memo[0] = 0
    memo[1] = 1
    
    fibonacci(n: n-1)
}

fibonacciHelper(n: 10)
