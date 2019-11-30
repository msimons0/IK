func targetSum(arr: [Int], target: Int) -> Bool {
    var result:[[Int]] = []
    var slate:[Int] = []
    targetSumHelper(slate: &slate, bag: arr, index: 0, target: target, intermediateSum: 0, result: &result)
    return result.count != 0
}

func targetSumHelper(slate: inout [Int], bag: [Int], index: Int, target: Int, intermediateSum: Int, result: inout [[Int]]) {
    if intermediateSum == target && slate.count != 0 {
        result.append(slate)
        return
    } else if index == bag.count {
        return
    } else {
        targetSumHelper(slate: &slate, bag: bag, index: index+1, target: target, intermediateSum: intermediateSum, result: &result)
        
        slate.append(bag[index])
        targetSumHelper(slate: &slate, bag: bag, index: index+1, target: target, intermediateSum: intermediateSum+bag[index], result: &result)
        slate.popLast()
    }
}

print(targetSum(arr: [2,4,6], target: 6))
