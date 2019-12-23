func insertionSort(n: Int, array: inout [Int]) -> [Int]{
    if n==0 {
        return array
    } else {
        insertionSort(n: n-1, array: &array)
        var counter = n
        while array[counter] < array[counter-1] {
            let temp = array[counter]
            array[counter] = array[counter-1]
            array[counter-1] = temp
            counter -= 1
        }
        return array
    }
}


func insertionSortHelper() {
    var array = [1,3454,9834,972,36,465,78,2435,123568,123,45,123,45]
    insertionSort(n: array.count-1, array: &array)
    print(array)
}

insertionSortHelper()
