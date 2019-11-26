///Generate All Possible Expressions That Evaluate To The Given Target Value

func generate_all_expressions(s: String, target: Int) -> [String] {
    var slate:[Character]=[]
    var result:[String] = []
    recursiveExpressionHelper(bag: s, slate: &slate, index: 0, target: target, result: &result)
    return result
}

func recursiveExpressionHelper(bag: String, slate: inout [Character], index: Int, target: Int, result: inout [String]) {
    if index == bag.count && expression(slate: String(slate)) == target {
        result.append(String(slate))
    } else if index < bag.count {
        slate.append(Array(bag)[index])
        recursiveExpressionHelper(bag: bag, slate: &slate, index: index+1, target: target, result: &result)
        slate.popLast()
        
        if(slate != [] && slate[slate.count-1] != "*" && slate[slate.count-1] != "+") {
            slate.append("+")
            recursiveExpressionHelper(bag: bag, slate: &slate, index: index, target: target, result: &result)
            slate.popLast()
        
            slate.append("*")
            recursiveExpressionHelper(bag: bag, slate: &slate, index: index, target: target, result: &result)
            slate.popLast()
        }
    }
}

func expression(slate: String) -> Int {
    let numbersString = slate.split(separator:"+")
    var result = 0
    for numberString in numbersString {
        if numberString.contains("*") {
            let factors = numberString.split(separator:"*")
            var product = 1
            for factor in factors {
                product *= Int(String(factor))!
            }
            result += Int(product)
        } else {
            result += Int(String(numberString))!
        }
    }
    //print(slate + " = " + String(result))
    return result
}

let r = generate_all_expressions(s: "1234", target: 24)
print(r)
