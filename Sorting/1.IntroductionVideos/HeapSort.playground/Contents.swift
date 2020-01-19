var binaryTree:[Int] = [0]

func heapSort() {
    var array:[Int] = []
    var sortedArray:[Int] = []
    for _ in 0...10 {
        array.append(Int.random(in: 0...999))
    }
    print(array)
    for number in array {
        addNode(number)
    }
    for _ in 1..<binaryTree.count {
        sortedArray.append(extractRoot())
    }
    print(sortedArray)
}

func addNode(_ number: Int) {
    binaryTree.append(number)
    var parentIndex = (binaryTree.count-1)/2
    var currentIndex = binaryTree.count-1
    while parentIndex != 0  && binaryTree[parentIndex] < binaryTree[currentIndex] {
        binaryTree.swapAt(parentIndex, currentIndex)
        currentIndex = parentIndex
        parentIndex = parentIndex/2
    }
}

func extractRoot() -> Int {
    binaryTree.swapAt(1, binaryTree.count-1)
    let root = binaryTree.popLast()!
    var currentNode = 1, childNode1 = 2, childNode2 = 3
    
    while childNode1 < binaryTree.count && childNode2 < binaryTree.count {
        if binaryTree[childNode1] > binaryTree[childNode2] {
            binaryTree.swapAt(currentNode, childNode1)
            currentNode = childNode1
        } else {
            binaryTree.swapAt(currentNode, childNode2)
            currentNode = childNode2
        }
        childNode1 = currentNode * 2
        childNode2 = (currentNode * 2) + 1
    }
    
    if childNode1 >= binaryTree.count && childNode2 < binaryTree.count {
        if binaryTree[childNode2] > binaryTree[currentNode] {
            binaryTree.swapAt(childNode2, currentNode)
        }
    }
    
    if childNode2 >= binaryTree.count && childNode1 < binaryTree.count {
        if binaryTree[childNode1] > binaryTree[currentNode] {
            binaryTree.swapAt(childNode1, currentNode)
        }
    }
    return root
}

heapSort()
