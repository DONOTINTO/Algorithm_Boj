//
//  GraphSearch.swift
//  Graph_Tree_Start
//
//  Created by Bran on 5/1/24.
//

import Foundation

func bfsAdjMatrix(_ node: Int, _ edges: [[Int]]) {
  var adjMatrix: [[Int]] = .init(repeating: .init(repeating: 0, count: node + 1), count: node + 1)
  for edge in edges {
    adjMatrix[edge[0]][edge[1]] = 1
    adjMatrix[edge[1]][edge[0]] = 1
  }

  var vis: [Bool] = .init(repeating: false, count: node + 1)
  var queue: [Int] = []
  var front = 0

  queue.append(1)
  vis[1] = true

  while queue.count >= front + 1 {
    let cur = queue[front]
    front += 1
    print(cur)

    for degree in 1...node {
      if adjMatrix[cur][degree] == 0 { continue }
      if vis[degree] { continue }

      queue.append(degree)
      vis[degree] = true
    }
  }
}

func bfsAdjList(_ node: Int, _ edges: [[Int]]) {
  var adjList: [[Int]] = .init(repeating: [], count: node + 1)
  for edge in edges {
    adjList[edge[0]].append(edge[1])
    adjList[edge[1]].append(edge[0])
  }

  var vis: [Bool] = .init(repeating: false, count: node + 1)
  var queue: [Int] = []
  var front = 0

  // 1) 시작하는 노드를 Queue에 넣고 방문했다는 표시를 남김
  queue.append(1)
  vis[1] = true

  while queue.count >= front + 1 {
    // 2) 큐에서 노드를 꺼내고
    let cur = queue[front]
    front += 1
    print(cur)

    // 2) 해당노드와 연결된 노드 중
    for degree in adjList[cur] {
      if vis[degree] { continue } // 이미 방문한 노드인 경우 아무것도 하지않고
      // 처음으로 방문하는 거라면 방문했다는 표시를 남기고 큐에 넣음
      queue.append(degree)
      vis[degree] = true
    }
  }
}

func dfsAdjList(_ node: Int, _ edges: [[Int]]) {
  var adjList: [[Int]] = .init(repeating: [], count: node + 1)
  for edge in edges {
    adjList[edge[0]].append(edge[1])
    adjList[edge[1]].append(edge[0])
  }

  var vis: [Bool] = .init(repeating: false, count: node + 1)
  var stack: [Int] = []

  // 1) 시작하는 노드를 Stack에 넣고 방문했다는 표시를 남김
  stack.append(1)
  vis[1] = true

  while !stack.isEmpty {
    // 2) Stack에서 노드를 꺼내고
    let cur = stack.removeLast()
    print(cur)

    // 2) 해당노드와 연결된 노드 중
    for degree in adjList[cur] {
      if vis[degree] { continue } // 이미 방문한 노드인 경우 아무것도 하지않고
      // 처음으로 방문하는 거라면 방문했다는 표시를 남기고 Stack에 넣음
      stack.append(degree)
      vis[degree] = true
    }
  }
}
