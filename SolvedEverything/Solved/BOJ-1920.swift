/*
 [Boj-1920]
 N개의 정수 A[1], A[2], …, A[N]이 주어져 있을 때, 이 안에 X라는 정수가 존재하는지 알아내는 프로그램을 작성하시오.
 
 [INPUT]
 첫째 줄에 자연수 N(1 ≤ N ≤ 100,000)이 주어진다. 다음 줄에는 N개의 정수 A[1], A[2], …, A[N]이 주어진다. 다음 줄에는 M(1 ≤ M ≤ 100,000)이 주어진다. 다음 줄에는 M개의 수들이 주어지는데, 이 수들이 A안에 존재하는지 알아내면 된다. 모든 정수의 범위는 -231 보다 크거나 같고 231보다 작다.
 
 [OUTPUT]
 M개의 줄에 답을 출력한다. 존재하면 1을, 존재하지 않으면 0을 출력한다.
 */

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

// 이진탐색
for i in 0 ..< m {
    var start = 0
    var end = a.count - 1
    var key = false
    
    while start <= end {
        let mid = (start + end) / 2
        if a[mid] == input[i] {
            key = true
            break
        } else if a[mid] > input[i] {
            end = mid - 1
        } else if a[mid] < input[i] {
            start = mid + 1
        }
    }
    
    key == true ? print("1") : print("0")
}

// 숏코딩용
// let n = Int(readLine()!)!
// let a = Set(readLine()!.split(separator: " ").map { Int($0)! }.sorted())
// let m = Int(readLine()!)!
// let input = readLine()!.split(separator: " ").map { Int($0)! }

// input.forEach { print(a.contains($0) ? 1 : 0) }
