func countOfPaths(rows: Int, columns: Int) -> Int {
    var array: [[Int]] = [[Int]](repeating: Array(repeating: 1, count: columns), count: 2)
    
    for row in 1..<rows {
        for column in 1..<columns {
            array[row%2][column] = array[(row-1)%2][column] + array[row%2][column-1]
        }
    }
    
    return array[(rows-1)%2][columns-1]
}

print(countOfPaths(rows: 5, columns: 5))
