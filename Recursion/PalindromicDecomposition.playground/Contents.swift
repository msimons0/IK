func palindromicDecomposer(input: String) -> [String] {
    var result:[String] = []
    var slate = ""
    palindromicDecompositionHelper(bag: input, slate: &slate, index:0, result: &result)
    return result
}

func palindromicDecompositionHelper(bag: String, slate: inout String, index: Int, result: inout [String]) {
    if slate.split(separator: "|").count != 0 && !isPalindrome(word: String(slate.split(separator: "|")[slate.split(separator: "|").count-1])) {
        return
    } else if index == bag.count {
        slate =  String(Array(slate)[1..<slate.count])
        result.append(slate)
        return
    } else {
        for counter in index..<bag.count {
            if isPalindrome(word: String(Array(bag)[index...counter])) {
                let oldSlate = slate
                slate.append("|" + String(Array(bag)[index...counter]))
                palindromicDecompositionHelper(bag: bag, slate: &slate, index:index+String(Array(bag)[index...counter]).count, result: &result)
                slate = oldSlate
            }
        }
    }
}

func isPalindrome(word: String) -> Bool {
    if word.count == 0 {
        return false
    }
    for index in 0..<word.count/2 {
        if Array(word)[index] != Array(word)[word.count-index-1] {
            return false
        }
    }
    return true
}

print(palindromicDecomposer(input: "eeeeeeeeeeeeeeeeeeee"))

