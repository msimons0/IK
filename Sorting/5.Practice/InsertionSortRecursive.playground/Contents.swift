var array = [12,578,234,789,34,67,12,78,1272,32]

func insertionSort(n: Int, array: inout [Int]) -> [Int] {
    if n==0 {
        return array
    } else {
        insertionSort(n: n-1, array: &array)
        var index = n
        while index>0 &&  array[index] < array[index-1] {
            array.swapAt(index, index-1)
            index -= 1
        }
        return array
    }
}

func insertionSortHelper() -> [Int] {
    insertionSort(n: array.count-1, array: &array)
}

print(insertionSortHelper())
