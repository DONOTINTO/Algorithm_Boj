//
//  FloodFill.swift
//  Graph_Tree_Start
//
//  Created by Bran on 5/1/24.
//

import Foundation

var board: [[Int]] = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]
let w = board[0].count
let h = board.count

func floodFill() {
  let dy = [-1, 1, 0, 0]
  let dx = [0, 0, -1, 1]
  var vis: [[Bool]] = .init(repeating: .init(repeating: false, count: w), count: h)

  var queue: [(Int, Int)] = []
  var front = 0

  let start = (4, 5)
  queue.append(start)
  vis[start.0][start.1] = true

  while queue.count >= front + 1 {
    let cur = queue[front]
    front += 1
    board[cur.0][cur.1] = 3

    for dir in 0..<4 {
      let ny = cur.0 + dy[dir]
      let nx = cur.1 + dx[dir]

      if ny < 0 || nx < 0 || ny >= h || nx >= w { continue }
      if vis[ny][nx] { continue }
      if board[ny][nx] == 1 { continue }

      queue.append((ny, nx))
      vis[ny][nx] = true
    }
  }
}

func boardPrint(board: [[Int]]) {
  for y in 0..<board.count {
    for x in 0..<board[0].count {
      print(board[y][x], terminator: " ")
    }
    print("")
  }
}
