func combination(n: Int, k: Int) -> Int {
    var array: [[Int]] = [[Int]](repeating: Array(repeating: 0, count: k+1), count: 2)
    
    if k==0 || k==n {
        return 1
    }
    
    array[0][0] = 1
    array[1][0] = 1
    array[1][1] = 1
    
    for row in 2...n {
        for col in 1...min(row, k) {
            array[row%2][col] = array[(row-1)%2][col-1] + array[(row-1)%2][col]
        }
    }
    
    return array[n%2][k]
}

print(combination(n: 10, k: 7))
