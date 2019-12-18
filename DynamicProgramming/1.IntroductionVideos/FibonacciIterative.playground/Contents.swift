 
 func fibonacci(n: Int) {
    var fib:[Int] = [Int](repeating: 0, count: 3)
    fib[1] = 1
    print(fib[0])
    print(fib[1])
    
    for i in 2..<n {
        fib[i%3] = fib[(i-1)%3] + fib[(i-2)%3]
        print(fib[i%3])
    }
 }
 
 fibonacci(n: 10)
