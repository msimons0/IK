func insertionSort(n: Int, array: inout [Int]) {
    for i in 1...n-1 {
        var count = i
        while array[count] < array[count-1] {
            array.swapAt(count, count-1)
            count-=1
        }
    }
}

func insertionSortHelper(array: [Int]) -> [Int] {
    var array = array
    insertionSort(n: array.count, array: &array)
    return array
}

print(insertionSortHelper(array: [1,3454,9834,972,36,465,78,2435,123568,123,45,123,45]))

