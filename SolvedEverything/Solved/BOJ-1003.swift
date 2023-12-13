/*
 [Boj-1003]
 // https://www.acmicpc.net/problem/1003
 */

var count: [Int] = [0,1]

for i in 2 ... 40 {
    count.append(count[i - 1] + count[i - 2])
}

for _ in 0 ..< Int(readLine()!)! {
    let input = Int(readLine()!)!
    input == 0 ? (print("\(count[1]) \(count[0])")) : (print("\(count[input - 1]) \(count[input])"))
}

// 1 - 1, 0
// 2 - 1, 1
// 3 - 1, 2
// 4 - 2, 3
// 5 - 3, 5
// 6 - 5, 8
