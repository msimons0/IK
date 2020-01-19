func countingSort() {
    var array = [1,2,5,7,3,7,9,0,4,6,8,4,5,7,8,5,2]
    var sorter:[Int:Int] = [:]
    
    for i in 0..<array.count {
        if let value = sorter[array[i]] {
            sorter[array[i]] = value + 1
        } else {
            sorter[array[i]]  = 1
        }
    }
    print(array)
    print(sorter)
    
    var index = 0
    for i in array.min()!...array.max()! {
        if let count = sorter[i] {
            array[index...index+count-1] = ArraySlice(repeating: i, count: count)
            index += count
        }
    }
    print(array)
}

countingSort()
