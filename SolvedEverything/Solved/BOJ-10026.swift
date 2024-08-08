/*
 [Boj-10026]
 // https://www.acmicpc.net/problem/10026
 */

import Foundation

let input = Int(readLine()!)!
var map: [[String]] = Array<[String]>()
var rgMap: [[String]] = Array<[String]>()
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: input), count: input)

var directions = [(0, -1), (0, 1), (-1, 0), (1, 0)]

var result = 0
var rgResult = 0

for _ in 0 ..< input {
    
    let data = readLine()!.map { String($0) }
    let rgData = data.map { datum -> String in
        
        if datum == "R" {
            return "G"
        }
        
        return datum
    }
    
    map.append(data)
    rgMap.append(rgData)
}

func dfs(x: Int, y: Int, color: String, map: [[String]]) {
    
    if x < 0 || x >= input || y < 0 || y >= input || map[y][x] != color || visited[y][x] {
        return
    }
    
    visited[y][x] = true
    
    for direction in directions {
        
        let newX = x + direction.0
        let newY = y + direction.1
        
        dfs(x: newX, y: newY, color: color, map: map)
    }
}

for y in 0 ..< input {
    for x in 0 ..< input {
        
        if !visited[y][x] {
            result += 1
            let color = map[y][x]
            dfs(x: x, y: y, color: color, map: map)
        }
    }
}

print(result)

visited = Array(repeating: Array(repeating: false, count: input), count: input)

for y in 0 ..< input {
    for x in 0 ..< input {
        
        if !visited[y][x] {
            rgResult += 1
            let color = rgMap[y][x]
            dfs(x: x, y: y, color: color, map: rgMap)
        }
    }
}

print(rgResult)
