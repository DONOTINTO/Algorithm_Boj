/*
 [Boj-2630]
 // https://www.acmicpc.net/problem/2630
 */

import Foundation

var input = Int(readLine()!)!
var map: [Int] = []
var count0 = 0
var count1 = 0

for _ in 0 ..< input {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    line.forEach { map.append($0) }
}

func find(map: [Int]) {
    input = Int(sqrt(Float(map.count)))
    var first = [Int]()
    var second = [Int]()
    var third = [Int]()
    var forth = [Int]()

    if (map.reduce(0, +) % map.count) == 0 {
        if map[0] == 0 {
            count0 += 1
            return
        } else {
            count1 += 1
            return
        }
    }
    
    if map.count == 4 {
        map.forEach {
            if $0 == 0 {
                count0 += 1
            } else {
                count1 += 1
            }
        }
        return
    }
    
    for i in 0 ..< map.count {
        var quotient = i / (input / 2)
        if quotient % 2 == 0 && quotient < input {
            first.append(map[i])
        } else if quotient % 2 == 1 && quotient < input {
            second.append(map[i])
        } else if quotient % 2 == 0 && quotient >= input {
            third.append(map[i])
        } else if quotient % 2 == 1 && quotient >= input {
            forth.append(map[i])
        }
    }
    
    find(map: first)
    find(map: second)
    find(map: third)
    find(map: forth)
}

find(map: map)
print(count0)
print(count1)
