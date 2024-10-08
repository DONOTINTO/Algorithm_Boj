//다시 실행하고 싶은 문제는 Solved 파일 내 문제를 복사하여 이곳(main.swift)에 붙여놓고 실행

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
