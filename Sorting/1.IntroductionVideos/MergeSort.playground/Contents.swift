func mergeSort(start: Int, end: Int, array: inout [Int]) {
    if start >= end {
        return
    } else {
        let mid = (start+end)/2
        mergeSort(start: start, end: mid, array: &array)
        mergeSort(start: mid + 1, end: end, array: &array)
        var i = start
        var j = mid + 1
        var auxArray:[Int] = []
        while i <= mid && j <= end {
            if array[i] < array[j] {
                auxArray.append(array[i])
                i += 1
            } else {
                auxArray.append(array[j])
                j += 1
            }
        }
        while i <= mid {
            auxArray.append(array[i])
            i += 1
        }
        while j <= end {
            auxArray.append(array[j])
            j += 1
        }
        array[start...end] = ArraySlice(auxArray)
        return
    }
}

func mergeSortHelper(array: [Int]) {
    var array = array
    mergeSort(start: 0, end: array.count-1, array: &array)
    print(array)
}
 
mergeSortHelper(array: [128,582,842,367,459,513,257,920,134,147,826,972,223,506,122,563])
