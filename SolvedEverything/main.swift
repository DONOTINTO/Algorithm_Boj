//다시 실행하고 싶은 문제는 Solved 파일 내 문제를 복사하여 이곳(main.swift)에 붙여놓고 실행

import Foundation

let node = 6
let edges: [[Int]] = [
  [1, 2], [3, 2], [2, 6],
  [4, 3], [6, 4], [4, 5]
]
let costs: [[Int]] = [
  [1, 2, 3], [3, 2, 1], [2, 6, 2],
  [4, 3, 10], [6, 4, -3], [4, 5, 9]
]

func graphAdjMat(_ node: Int, _ edges: [[Int]]) {
    var adjMat: [[Int]] = .init(repeating: .init(repeating: 0, count: node + 1), count: node + 1)
    
    print(adjMat)
    
    for edge in edges {
        
        adjMat[edge[0]][edge[1]] = 1
        adjMat[edge[1]][edge[0]] = 1
    }
    
    for y in 1...node {
        for x in 1...node {
            print(adjMat[y][x], terminator: " ")
        }
        print("")
    }
}

graphAdjMat(node, edges)
//directedGraphAdjMat(node, edges)
//weightedGraphAdjMat(n, costs)
//graphAdjList(node, edges)

//bfsAdjMatrix(node, edges)
//bfsAdjList(node, edges)
//dfsAdjList(node, edges)

// print("-------Before-------")
// boardPrint(board: board)
// 
// print("-------After-------")
// floodFill()
// boardPrint(board: board)
