/*
 [Boj-2108]
 // https://www.acmicpc.net/problem/2108
 */

import Foundation

var nums = [Int]()
var dic = [Int: Int]()

for _ in 0 ..< Int(readLine()!)! {
    let num = Int(readLine()!)!
    nums.append(num)
    dic[num, default: 1] += 1
}

let num = Double(nums.reduce(0, +)) / Double(nums.count)
print(Int(round(num)))

print((nums.sorted())[nums.count / 2])

let dicMax = dic.max { $0.value < $1.value }!.value
let mode = dic.filter { $0.value == dicMax }.keys.sorted()
print(mode.count > 1 ? mode[1] : mode[0])

print(nums.max()! - nums.min()!)
