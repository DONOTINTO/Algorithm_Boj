/*
 [Boj-2468]
 // https://www.acmicpc.net/problem/2468
 */

import Foundation

let n = Int(readLine()!)!
var map: [[Int]] = []
var heights = Set<Int>()
var sortedHeights = [Int]()
let directions = [(0, -1), (0, 1), (-1, 0), (1, 0)]
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var mapCount = 0
var result = 0

for _ in 0 ..< n {
    
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    
    line.forEach { heights.insert($0) }
    
    map.append(line)
}

sortedHeights = heights.sorted()

func dfs(x: Int, y: Int, height: Int) {
    
    if x < 0 || x >= n || y < 0 || y >= n || map[y][x] <= height || visited[y][x] {
        return
    }
    
    visited[y][x] = true
    
    for direction in directions {
        
        let newX = x + direction.0
        let newY = y + direction.1
        dfs(x: newX, y: newY, height: height)
    }
}

for i in sortedHeights {
    for y in 0 ..< map.count {
        for x in 0 ..< map.count {
            if !visited[y][x] && map[y][x] > i {
                dfs(x: x, y: y, height: i)
                mapCount += 1
            }
        }
    }
    
    result = max(result, mapCount)
    mapCount = 0
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

print(result == 0 ? 1 : result)
