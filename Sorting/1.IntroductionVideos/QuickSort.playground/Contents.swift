func quickSort() {
    var array = [12,21,67,3,77,27,83,14,16,26,77,28]
    quickSortHelper(start: 0, end: array.count-1, array: &array)
    print(array)
}

func quickSortHelper(start: Int, end: Int, array: inout [Int]) {
    if start >= end {
        return
    } else {
        let randomIndex = Int.random(in: start...end)
        array.swapAt(start, randomIndex)
        var index = start
        for i in start+1...end {
            if array[i] < array[start] {
                index += 1
                array.swapAt(index, i)
            }
        }
        array.swapAt(start, index)
        quickSortHelper(start: start, end: index-1, array: &array)
        quickSortHelper(start: index+1, end: end, array: &array)
    }
}

quickSort()
