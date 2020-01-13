func insertionSort(n: Int, array: inout [Int]) -> [Int]{
    if n==0 {
        return array
    } else {
        insertionSort(n: n-1, array: &array)
        var counter = n
        while counter > 0 && array[counter] < array[counter-1] {
            print(counter)
            array.swapAt(counter, counter-1)
            counter -= 1
        }
        return array
    }
}


func insertionSortHelper() {
    var array = [1,3454,9834,972,36,465,78,2435,123568,123,45,123,45]
    //var array = [34,6,56,2,56,786,54,23,78,234,34,32,12]
    insertionSort(n: array.count-1, array: &array)
    print(array)
}

insertionSortHelper()
