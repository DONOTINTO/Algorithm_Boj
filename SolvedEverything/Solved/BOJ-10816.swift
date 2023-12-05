/*
 [Boj-10816]
 // https://www.acmicpc.net/problem/10816
 */

let n = Int(readLine()!)!
let nArr = Dictionary(readLine()!.split(separator: " ").map { (Int($0)!, 1) }) { $0 + $1 }
let m = Int(readLine()!)!
let mArr = readLine()!.split(separator: " ").map { Int($0)! }

mArr.forEach { print(nArr[$0, default: 0], terminator: " ") }
