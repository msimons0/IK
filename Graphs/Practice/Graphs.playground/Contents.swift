class Graph {
    var adjacencyList: [[Int]]
    var V: Int
    
    init(size: Int) {
        V = size
        adjacencyList = [[Int]](repeating: [], count: size)
    }
    
    func addEdge(start: Int, end: Int, bidirectional: Bool = true) {
        adjacencyList[start].append(end)
        if bidirectional {
            adjacencyList[end].append(start)
        }
    }
    
    func hasEulerianCycle() -> Bool {
        var numberOfOddDegrees = 0
        for adjacentNodes in adjacencyList {
            if adjacentNodes.count % 2 == 1 {
                numberOfOddDegrees += 1
            }
        }
        return numberOfOddDegrees == 0
    }
    
    func hasEulerianPath() -> Bool {
        var numberOfOddDegrees = 0
        for adjacentNodes in adjacencyList {
            if adjacentNodes.count % 2 == 1 {
                numberOfOddDegrees += 1
            }
        }
        return numberOfOddDegrees == 0 || numberOfOddDegrees == 2
    }
    
    func BFS(node: Int) -> Void {
        var captured = [Int](repeating: 0, count: V)
        var parent = [Int?](repeating: nil, count: V)
        var visited = [Int](repeating: 0, count: V)
        
        captured[node] = 1
        visited[node] = 1
        
        var q = Queue()
        q.enqueue(element: node)
        
        while q.items.count != 0 {
            if let v = q.dequeue() {
                captured[v] = 1
                for w in adjacencyList[v] {
                    if visited[w] == 0 {
                        parent[w] = v
                        visited[w] = 1
                        q.enqueue(element: w)
                    }
                }
            }
        }
    }
    
    func DFS(node: Int) {
        var captured = [Int](repeating: 0, count: V)
        var parent = [Int?](repeating: nil, count: V)
        var visited = [Int](repeating: 0, count: V)
        
        captured[node] = 1
        visited[node] = 1
        
        var s = Stack()
        s.enqueue(element: node)
        
        while s.items.count != 0 {
            if let v = s.dequeue() {
                captured[v] = 1
                for w in adjacencyList[v] {
                    if visited[w] == 0 {
                        parent[w] = v
                        visited[w] = 1
                        s.enqueue(element: w)
                    }
                }
            }
        }
    }
    
    func DFSRecursive(node: Int, visited: inout [Int], parent: inout [Int?], component: Int) {
        visited[node] = component
        for w in adjacencyList[node] {
            if visited[w] == 0 {
                parent[w] = node
                DFSRecursive(node: w, visited: &visited, parent: &parent, component: component)
            }
        }
    }
    
    func findComponents() -> Void {
        var visited = [Int](repeating: 0, count: V)
        var parent = [Int?](repeating: nil, count: V)
        var component = 0
        for node in visited {
            if node == 0 {
                component += 1
                DFSRecursive(node: node, visited: &visited, parent: &parent, component: component)
            }
        }
    }
    
    func printAdjacencyList() {
        print(adjacencyList)
    }
}

struct Queue{
    var items:[Int] = []
    
    mutating func enqueue(element: Int) {
        items.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if items.isEmpty {
            return nil
        } else {
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement
        }
    }
}

struct Stack{
    var items:[Int] = []
    
    mutating func enqueue(element: Int) {
        items.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if items.isEmpty {
            return nil
        } else {
            return items.popLast()
        }
    }
}

var g = Graph(size: 5)
g.printAdjacencyList()
g.addEdge(start: 0, end: 1)
g.addEdge(start: 0, end: 4)
g.printAdjacencyList()


func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    var adjacencyList = [[Int]](repeating: [], count: n)
    var parent = [Int?](repeating:nil, count: n)
    var visited = [Int](repeating:0, count: n)
    var components = 0
    
    for nodes in edges {
        adjacencyList[nodes[0]].append(nodes[1])
        adjacencyList[nodes[1]].append(nodes[0])
    }
    print(adjacencyList)
    for i in 0..<visited.count {
        if visited[i] == 0 {
            components += 1
            DFS(node: i, parent: &parent, visited: &visited, component: components, adjacencyList: &adjacencyList)
        }
    }
    
    return components
}

func DFS(node: Int, parent: inout [Int?], visited: inout [Int], component: Int, adjacencyList: inout [[Int]]) {
    visited[node] = component
    for neighbour in adjacencyList[node] {
        if visited[neighbour] == 0 {
            parent[neighbour] = node
            DFS(node: neighbour, parent: &parent, visited: &visited, component: component, adjacencyList: &adjacencyList)
        }
    }
}

countComponents(5, [[0, 1], [1, 2], [3, 4]])
