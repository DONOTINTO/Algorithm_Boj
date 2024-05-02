//
//  Graph.swift
//  Graph_Tree_Start
//
//  Created by Bran on 5/1/24.
//

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

/**
 Directed [x] + Weighted [x] + AdjMatrix
 - Parameters:
 - node: node의 개수
 - edges: [ [1, 2], [2, 3] ] 2차원 배열로 표현된 각 노드간 연결 구성 정보
 */
func graphAdjMat(_ node: Int, _ edges: [[Int]]) {
    var adjMat: [[Int]] = .init(repeating: .init(repeating: 0, count: node + 1), count: node + 1)
    
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

/// Directed [o] + Weighted [x] + AdjMatrix
func directedGraphAdjMat(_ node: Int, _ edges: [[Int]]) {
    var adjMat: [[Int]] = .init(repeating: .init(repeating: 0, count: node + 1), count: node + 1)
    
    for edge in edges {
        adjMat[edge[0]][edge[1]] = 1
    }
    
    for y in 1...node {
        for x in 1...node {
            print(adjMat[y][x], terminator: " ")
        }
        print("")
    }
}


func weightedGraphAdjMat(_ node: Int, _ cost: [[Int]]) {
    var adjMat: [[Int]] = .init(repeating: .init(repeating: 0, count: node + 1), count: node + 1)
    
    for edge in cost {
        adjMat[edge[0]][edge[1]] = edge[2]
        adjMat[edge[1]][edge[0]] = edge[2]
    }
    
    for y in 1...node {
        for x in 1...node {
            print(adjMat[y][x], terminator: " ")
        }
        print("")
    }
}

/// Directed [x] + Weighted [x] + AdjList
func graphAdjList(_ node: Int, _ edges: [[Int]]) {
    var adjList: [[Int]] = .init(repeating: [], count: node + 1)
    
    for edge in edges {
        adjList[edge[0]].append(edge[1])
        adjList[edge[1]].append(edge[0])
    }
    
    for i in 1...node {
        print(adjList[i])
    }
}
