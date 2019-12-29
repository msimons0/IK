func quickSort() {
    var array = [12,21,67,3,77,27,83,14,16,26,77,28]
    quickSortHelper(array: &array, start: 0, end: array.count-1)
    print(array)
}

func quickSortHelper(array: inout [Int], start: Int, end: Int) {
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
        quickSortHelper(array: &array, start: start, end: index-1)
        quickSortHelper(array: &array, start: index+1, end: end)
    }
}

quickSort()
