/*
 [Boj-18511]
 // https://www.acmicpc.net/problem/18511
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
let elements = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0
func selectNumber(_ selectedArray: [Int]) {
    let num = Int(selectedArray.map { String($0) }.reduce("", +)) ?? 0

    if num <= n {
        answer = max(answer, num)
    }
    
    if selectedArray.count == "\(n)".count {
        return
    }
    
    for element in elements {
        selectNumber(selectedArray + [element])
    }
}

selectNumber([])
print(answer)
