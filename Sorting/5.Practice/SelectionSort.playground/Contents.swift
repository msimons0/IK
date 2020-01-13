let array = [76,23,678,234,789,34,89,34,45,23]

func selectionSort(array: [Int]) -> [Int] {
    var array = array
    for i in 0..<array.count {
        var index = i
        for j in i+1..<array.count {
            if array[j] < array[index] {
                index = j
            }
        }
        array.swapAt(index, i)
    }
    return array
}
 print(selectionSort(array: array))
