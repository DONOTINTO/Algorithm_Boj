/*
 [Boj-15829]
 // https://www.acmicpc.net/problem/15829
 */

import Foundation

let count = Int(readLine()!)!
let input = readLine()!.map { String($0) }.map { Int(exactly: UnicodeScalar($0)!.value)! - 96 }
let m = 1234567891
var sum = 0

func power(_ power: Int, _ n: Int) -> Int {
    [Int].init(repeating: power, count: n).reduce(1) {
        if $0 > m { return $0 % m * $1 }
        return $0 * $1
    }
}

for i in 0 ..< input.count {
    sum += input[i] * power(31, i)
}

print(sum % m)
