var array = [12,78,145,08,124,79,4,7890,34,7]

func bubblesortHelper(array: [Int]) -> [Int] {
    var array = array
    for i in 0..<array.count {
        for j in i+1..<array.count {
            if array[i] < array[j] {
                array.swapAt(i, j)
            }
        }
    }
    return array
}

print(bubblesortHelper(array: array))

//TIme taken 3.30s
