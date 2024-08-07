/*
 [Boj-11724]
 // https://www.acmicpc.net/problem/11724
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let n = input[0]
let m = input[1]

var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited: [Bool] = Array(repeating: false, count: n + 1)
visited[0] = true
var result = 0

for _ in 0 ..< m {
    
    let injacent = readLine()!.split(separator: " ").map { Int($0)! }
    
    if !graph[injacent[0]].contains(injacent[1]) {
        graph[injacent[0]].append(injacent[1])
    }
    
    if !graph[injacent[1]].contains(injacent[0]) {
        graph[injacent[1]].append(injacent[0])
    }
}

func dfs(start: Int) {
    
    visited[start] = true
    
    for nextNode in graph[start] {
        if !visited[nextNode] {
            dfs(start: nextNode)
        }
    }
}


for i in 1 ... n {
    
    if visited.contains(false) && !visited[i] {
        result += 1
        dfs(start: i)
    }
}

print(result)
