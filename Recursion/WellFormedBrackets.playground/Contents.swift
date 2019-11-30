
func brackets(number: Int) -> [String] {
    var result:[String] = []
    var slate:String = ""
    bracketsHelper(numberLeftRemaining: number, numberRightRemaining: number, slate: &slate, result: &result)
    return result
}

func bracketsHelper(numberLeftRemaining: Int, numberRightRemaining: Int, slate: inout String, result: inout [String]) {
    if numberLeftRemaining > numberRightRemaining || numberLeftRemaining < 0 || numberRightRemaining < 0 {
        return
    } else if numberLeftRemaining == 0 && numberRightRemaining == 0 {
        result.append(slate)
        return
    } else {
        slate.append("(")
        bracketsHelper(numberLeftRemaining: numberLeftRemaining-1, numberRightRemaining: numberRightRemaining, slate: &slate, result: &result)
        slate.popLast()
        
        slate.append(")")
        bracketsHelper(numberLeftRemaining: numberLeftRemaining, numberRightRemaining: numberRightRemaining-1, slate: &slate, result: &result)
        slate.popLast()
    }
}

print(brackets(number: 3))
