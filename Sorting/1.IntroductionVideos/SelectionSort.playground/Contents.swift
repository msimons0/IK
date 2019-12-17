import PlaygroundSupport

func selectionSortHelper() {
    let array = [128,582,842,367,459,513,257,920,134,147,826,972,223,56,1212,563]
    print(selectionSort(unsortedArray: array))
}

func selectionSort(unsortedArray: [Int]) -> [Int] {
    var array = unsortedArray
    var swapCount = 0
    var iterationCount = 0
    
    for currentIndex in 0..<array.count {
        var minimumIndex = currentIndex
        for index in currentIndex..<array.count {
            if array[index] < array[minimumIndex] {
                minimumIndex = index
            }
            iterationCount += 1
        }
        swapCount += 1
        array.swapAt(minimumIndex, currentIndex)
    }
    print("n:\(array.count) Swap Count: \(swapCount) Iteration Count:\(iterationCount)")
    return array
}

selectionSortHelper()
