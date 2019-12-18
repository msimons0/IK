func combination(n: Int, k: Int) -> Int {
    var array: [[Int]] = [[Int]](repeating: Array(repeating: 0, count: k+1), count: n+1)
    
    if k==0 || k==n {
        return 1
    }
    
    for row in 0...n {
        array[row][0] = 1
    }
    
    for i in 0...k {
        array[i][i] = 1
    }
    
    for row in 2...n {
        for col in 1...min(row, k) {
            array[row][col] = array[row-1][col-1] + array[row-1][col]
        }
    }
    
    return array[n][k]
}

print(combination(n: 10, k: 7))
