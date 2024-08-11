/*
 [Boj-11725]
 // https://www.acmicpc.net/problem/11725
 */

import Foundation

let vertexCount = Int(readLine()!)!

var injacent: [[Int]] = Array(repeating: [], count: vertexCount + 1)
var parent: [Int] = Array(repeating: 0, count: vertexCount + 1)
var visited: [Bool] = Array(repeating: false, count: vertexCount + 1)


for _ in 0 ..< vertexCount - 1 {
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    injacent[input[0]].append(input[1])
    injacent[input[1]].append(input[0])
}

func dfs(start: Int) {
    
    visited[start] = true
    for injac in injacent[start] {
        if !visited[injac] {
            parent[injac] = start
            dfs(start: injac)
        }
    }
}

dfs(start: 1)

for i in 2 ... vertexCount {
    print(parent[i])
}
