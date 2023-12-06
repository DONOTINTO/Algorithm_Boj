/*
 [Boj-2775]
 // https://www.acmicpc.net/problem/2775
 */

let testCase = Int(readLine()!)!

for _ in 0 ..< testCase {
    let floor = Int(readLine()!)!
    let ho = Int(readLine()!)!
    
    let zero = [Int](1 ... ho)
    var a = [[Int]]()
    a.append(zero)
    
    for i in 0 ..< floor {
        var nfloor = [Int]()
        for j in 0 ..< ho {
            if j == 0 { nfloor.append(1); continue }
            nfloor.append(a[i][j] + nfloor[j - 1])
        }
        a.append(nfloor)
    }
    print(a[floor][ho - 1])
}
