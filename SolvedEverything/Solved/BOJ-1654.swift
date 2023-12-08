/*
 [Boj-1654]
 // https://www.acmicpc.net/problem/1654
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
var line = [Int]()

for _ in 0 ..< input[0] {
    let temp = Int(readLine()!)!
    line.append(temp)
}

var start = 1
var end = line.max()!

while start <= end {
    var sum = 0
    let middle = (start + end) / 2
    
    line.forEach { sum += $0 / middle}
    
    if sum >= input[1] {
        start = middle + 1
    } else {
        end = middle - 1
    }
}

print(end)
