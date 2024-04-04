/*
 [Boj-3273]
 // https://www.acmicpc.net/problem/3273
 */

var count = 0
let _ = Int(readLine()!)!

var arr = Set(readLine()!.split(separator: " ").map { Int($0)! })

let result = Int(readLine()!)!

for ele in arr {
    
    let need = result - ele
    
    if need == ele {
        continue
    }
    
    if arr.contains(need) {
        count += 1
        arr.remove(ele)
        arr.remove(need)
    }
}

print(count)
