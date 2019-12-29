
func countingSortHelper() {
    let n = [9,1,3,7,8,3,5,6,7,3,4,9,1,3,7,8,3,5,6,7,3,4,0]
    print(n)
    print(countingSort(n:n))
}

func countingSort(n: [Int]) -> [Int] {
    var frequency:[Int] = [Int](repeatElement(0, count: n.max()!+1))
    var auxArray:[Int] = [Int](repeating: 0, count: n.count)
    for i in 0..<n.count {
        frequency[n[i]] += 1
    }
    var counter = 0
    for i in 0..<frequency.count {
        if frequency[i] != 0 {
            auxArray[counter...(counter+frequency[i]-1)] = ArraySlice([Int](repeatElement(i, count: frequency[i])))
            counter += frequency[i]
        }
    }
    return auxArray
}

countingSortHelper()
