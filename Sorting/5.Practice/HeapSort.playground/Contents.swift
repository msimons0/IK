var binaryTree: [Int] = [0]

func heapSortHelper() {
    let array = [123,234,333]
    for i in 0..<array.count {
        add(node: array[i])
    }
    print(binaryTree)
    var auxArray: [Int] = []
    for _ in 0..<array.count {
        auxArray.append(extractRoot())
    }
    print(auxArray)
}

func add(node: Int) {
    binaryTree.append(node)
    var currentindex = binaryTree.count-1
    while currentindex != 1 && binaryTree[currentindex]>binaryTree[currentindex/2] {
        binaryTree.swapAt(currentindex, currentindex/2)
        currentindex /= 2
    }
}

func extractRoot() -> Int {
    binaryTree.swapAt(1, binaryTree.count-1)
    let root = binaryTree.popLast()!
    var currentNode=1, childNode1=2, childNode2=3
    
    while childNode1<binaryTree.count && childNode2<binaryTree.count {
        if binaryTree[childNode1]<binaryTree[childNode2] {
            binaryTree.swapAt(childNode2, currentNode)
            currentNode = childNode2
        } else {
            binaryTree.swapAt(childNode1, currentNode)
            currentNode = childNode1
        }
        childNode1 = currentNode*2
        childNode2 = currentNode*2+1
    }
    
    if childNode1<binaryTree.count {
        if binaryTree[childNode1]>binaryTree[currentNode]  {
            binaryTree.swapAt(childNode1, currentNode)
        }
    }
    
    return root
}

heapSortHelper()
