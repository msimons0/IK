
func find_all_arrangements(n: Int) -> [[String]] {
    var results:[[Int]] = []
    var slate:[Int] = []
    var bag:[Int] = []
    for index in 0..<n {
        bag.append(index)
    }
    queenPlacerHelper(slate: &slate, bag: bag, boardSize: n-1, result: &results)
    return converter(results: results)
}

func queenPlacerHelper(slate: inout [Int], bag: [Int], boardSize: Int, result: inout [[Int]]) {
    //print("slate:\(slate) bag:\(bag) boardSize:\(boardSize)")
    let canBeAttacked = canQueenBeAttacked(positions: slate)
    if slate.count<boardSize && canBeAttacked {
        return
    } else if slate.count>boardSize && !canBeAttacked  {
        result.append(slate)
        return
    } else if slate.count > boardSize {
        return
    } else {
        for counter in 0...boardSize {
            slate.append(bag[counter])
            queenPlacerHelper(slate: &slate, bag: bag, boardSize: boardSize, result: &result)
            slate.popLast()
        }
    }
}

func canQueenBeAttacked(positions: [Int]) -> Bool {
    print(positions)
    for index1 in 0..<positions.count {
        for index2 in 0..<positions.count {
            if index1 != index2 {
                if positions[index1] == positions[index2] {
                    return true // same row
                } else if abs(index1-index2) ==  abs(positions[index1]-positions[index2]) {
                    return true // same diagonal
                }
            }
        }
    }
    return false
}

func converter(results: [[Int]]) -> [[String]] {
    //print(results)
    var allResults:[[String]] = []
    for result in results {
        var resultsArray:[String] = []
        for index in 0..<result.count {
            var resultString: String = ""
            for index2 in 0..<result.count {
                if index2 == result[index] {
                    resultString.append("q")
                } else {
                    resultString.append("-")
                }
            }
            resultsArray.append(resultString)
        }
        allResults.append(resultsArray)
    }
    return allResults
}

print(find_all_arrangements(n: 4))
