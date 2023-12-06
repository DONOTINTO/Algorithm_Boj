/*
 [Boj-1676]
 // https://www.acmicpc.net/problem/1676
 */

// let input = [Int](1 ... Int(readLine()!)!)
// let a = String(input.reduce(1, *)).map { $0 }.reversed()
// var count = 0
//
// for elem in a {
//     if elem == "0" {
//         count += 1
//     } else {
//         print(count)
//         break
//     }
// }

let n = Int(readLine()!)!
print(n/5 + n/25 + n/125)
