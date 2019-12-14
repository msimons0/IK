///Generate All Possible Expressions That Evaluate To The Given Target Value

func generate_all_expressions(s: String, target: Int) -> [String] {
    var slate:[Character]=[]
    var result:[String] = []
    var intermediateResult:[Int] = []
    recursiveExpressionHelper(bag: s, slate: &slate, index: 0, target: target, intermediateResult: &intermediateResult, result: &result)
    return result
}

func recursiveExpressionHelper(bag: String, slate: inout [Character], index: Int, target: Int, intermediateResult: inout [Int], result: inout [String]) {
    if index == bag.count && sum(intermediateResult: intermediateResult) == target {
        result.append(String(slate))
    } else if index < bag.count {
        slate.append(Array(bag)[index])
        recursiveExpressionHelper(bag: bag, slate: &slate, index: index+1, target: target, intermediateResult: &intermediateResult,result: &result)
        slate.popLast()
        
        if(slate != [] && slate[slate.count-1] != "*" && slate[slate.count-1] != "+") {
            slate.append("*")
            recursiveExpressionHelper(bag: bag, slate: &slate, index: index, target: target, intermediateResult: &intermediateResult, result: &result)
            slate.popLast()
            
            let terms = slate.split(separator: "+")
            let lastTerm = terms[terms.count-1]
            if lastTerm.contains("*") {
                let factors = lastTerm.split(separator:"*")
                var product = 1
                for factor in factors {
                    product *= Int(String(factor))!
                }
                intermediateResult.append(product)
            } else {
                intermediateResult.append(Int(String(lastTerm))!)
            }
            print("\(slate) \(intermediateResult)")
            slate.append("+")
            recursiveExpressionHelper(bag: bag, slate: &slate, index: index, target: target, intermediateResult: &intermediateResult, result: &result)
            slate.popLast()
        }
    }
}

func sum(intermediateResult: [Int]) -> Int {
    var sum = 0
    for number in intermediateResult {
        sum += number
    }
    return sum
}

let r = generate_all_expressions(s: "1234", target: 24)
print(r)
