func superDigit(n: String, k: Int) -> Int {
    var slate = ""
    return superDigitHelper(bag: String(repeating: n, count: k), slate: &slate, index: 0, sum: 0)
}

func superDigitHelper(bag: String, slate: inout String, index: Int, sum: Int) -> Int {
    if index == bag.count && String(sum).count != 1 {
        var slate = ""
        return superDigitHelper(bag: String(sum), slate: &slate, index: 0, sum: 0)
    } else if index == bag.count && String(sum).count == 1{
        return sum
    } else {
        slate.append("\(Array(bag)[index])")
        //print("bag:\(bag) slate:\(slate) index:\(index) sum:\(sum)")
        let a = superDigitHelper(bag: bag, slate: &slate, index: index+1, sum: sum+Int(String(Array(bag)[index]))!)
        slate.popLast()
        return a
    }
}

print(superDigit(n: "1234567890", k: 10))
