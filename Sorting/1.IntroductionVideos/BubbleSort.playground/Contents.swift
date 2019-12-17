func bubbleSortHelper() {
    let array = [128,582,842,367,459,513,257,920,134,147,826,972,223,56,1212,563]
    print(bubbleSort(unsortedArray: array))
}

func bubbleSort(unsortedArray: [Int]) -> [Int] {
    var swap = 0
    var iteration = 0
    var array = unsortedArray
    for i in 0..<array.count {
        for j in i+1..<array.count {
            if array[i] > array[j] {
                array.swapAt(i, j)
                swap += 1
            }
            iteration += 1
        }
    }
    print("n:\(array.count) Swap Count: \(swap) Iteration Count:\(iteration)")
    return array
}

bubbleSortHelper()
