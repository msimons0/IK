var array = [123,78,23,678,23,78,34,785]

func insertionSort(array: [Int]) -> [Int] {
    var array = array
    for i in 1..<array.count {
        var index = i
        while index>0 && array[index] < array[index-1] {
            array.swapAt(index, index-1)
            index -= 1
        }
    }
    return array
}

print(insertionSort(array: array))
