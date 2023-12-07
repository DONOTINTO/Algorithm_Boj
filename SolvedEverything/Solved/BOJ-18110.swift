/*
 [Boj-18110]
 // https://www.acmicpc.net/problem/18110
 */

import Foundation

var n = Int(readLine()!)!
var score = [Double]()
var round = Int((Double(n) * 0.15).rounded())

func removeLast(arr: inout [Double], count: Int) {
    for _ in 0 ..< count { arr.removeLast() }
    arr.reverse()
    for _ in 0 ..< count { arr.removeLast() }
}

for _ in 0 ..< n { score.append(Double(readLine()!)!) }

score.sort()
removeLast(arr: &score, count: round)

if n == 0 {
    print("0")
} else {
    print(Int((score.reduce(0, +) / Double(score.count)).rounded()))
}
