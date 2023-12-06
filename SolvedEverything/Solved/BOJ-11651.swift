/*
 [Boj-11651]
 // https://www.acmicpc.net/problem/11651
 */

var storage = [[Int]]()

for _ in 0 ..< Int(readLine()!)! {
    storage.append(readLine()!.split(separator: " ").map { Int($0)! })
}

storage.sort {
    if $0[1] != $1[1] { return $0[1] < $1[1] }
    else { return $0[0] < $1[0] }
}

storage.forEach { print($0.map { String($0) }.joined(separator: " ")) }
