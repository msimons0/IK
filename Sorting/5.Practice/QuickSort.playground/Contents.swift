func quickSort(start: Int, end: Int, array: inout [Int]) {
    if start>=end {
        return
    } else {
        let randomIndex = Int.random(in: start...end)
        array.swapAt(start, randomIndex)
        var index = start
        for i in start+1...end {
            if array[start] < array[i] {
                index += 1
                array.swapAt(index, i)
            }
        }
        array.swapAt(start, index)
        quickSort(start: start, end: index-1, array: &array)
        quickSort(start: index+1, end: end, array: &array)
    }
}

func quickSortHelper() {
    var array = [23,567,324,86,34,78,234,89,234,893]
    quickSort(start:0, end:array.count-1, array: &array)
    print(array)
}

quickSortHelper()
