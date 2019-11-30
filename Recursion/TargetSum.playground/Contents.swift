
func targetSum(arr: [Int], target: Int) -> Bool {
    var result:[String] = []
    var slate:[Int] = []
    targetSumHelper(slate: &slate, bag: arr, index: 0, target: target, sum: 0, result: &result)
    //print(result)
    return result.count != 0
}

func targetSumHelper(slate: inout [Int], bag: [Int], index: Int, target: Int, sum: Int, result: inout [String]) {
    if sum == target && slate.count != 0 {
        result.append("\(slate)")
        return
    } else if index == bag.count {
        return
    } else {
        targetSumHelper(slate: &slate, bag: bag, index: index+1, target: target, sum: sum, result: &result)
        
        slate.append(bag[index])
        targetSumHelper(slate: &slate, bag: bag, index: index+1, target: target, sum: sum+bag[index], result: &result)
        slate.popLast()
    }
}

var arr = [2,4,6]
var result = targetSum(arr: arr, target: 0)
print(result)
