/*
 [Boj-18111]
 // https://www.acmicpc.net/problem/18111
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var (n, m, b) = (input[0], input[1], input[2])
var coor = [Int]()

for _ in 0 ..< n {
    var temp = readLine()!.split(separator: " ").map { Int($0)! }
    temp.reverse()
    for _ in 0 ..< m {
        coor.append(temp.popLast()!)
    }
}

var goals = Set(coor)
var result = [0, 0]

for goal in goals.min()! ... goals.max()! {
    var sec = 0
    var block = b
    
    for i in 0 ..< coor.count {
        if coor[i] > goal {
            sec += 2 * (coor[i] - goal)
            block += coor[i] - goal
        } else if coor[i] < goal {
            sec += goal - coor[i]
            block -= goal - coor[i]
        }
    }
    
    if block < 0 { continue }
    
    if result[0] == 0 {
        result[0] = sec
        result[1] = goal
    } else {
        if result[0] > sec {
            result[0] = sec
            result[1] = goal
        } else if result[0] == sec {
            result[1] = max(result[1], goal)
        }
    }
}


print("\(result[0]) \(result[1])")

