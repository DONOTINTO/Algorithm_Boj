/*
 [Boj-1260]
 // https://www.acmicpc.net/problem/1260
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let start = input[2]
var graph: [[Int]] = .init(repeating: [], count: input[0] + 1)
var DFSvisited = [Bool].init(repeating: false, count: input[0] + 1)
var BFSvisited = [Bool].init(repeating: false, count: input[0] + 1)
var willVisit = [Int]()

for _ in 0 ..< input[1] {
    let adjacency = readLine()!.split(separator: " ").map { Int($0)! }
    
    if !graph[adjacency[0]].contains(adjacency[1]) {
        graph[adjacency[0]].append(adjacency[1])
    }
    
    if !graph[adjacency[1]].contains(adjacency[0]) {
        graph[adjacency[1]].append(adjacency[0])
    }
}

for i in 0 ..< graph.count {
    graph[i].sort()
}

func dfs(start: Int) {
    DFSvisited[start] = true
    
    print(start, terminator: " ")
    
    for i in graph[start] {
        if !DFSvisited[i] {
            dfs(start: i)
        }
    }
}

func bfs(start: Int) {
    var willVisit = [start]
    
    BFSvisited[start] = true
    
    while !willVisit.isEmpty {
        let visit = willVisit.removeFirst()
        print(visit, terminator: " ")
        
        for i in graph[visit] {
            if !BFSvisited[i] {
                willVisit.append(i)
                BFSvisited[i] = true
            }
        }
    }
}

dfs(start: start)
print()
bfs(start: start)
