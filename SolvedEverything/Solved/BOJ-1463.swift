/*
 [Boj-1463]
 // https://www.acmicpc.net/problem/1463
 */

import Foundation

let n = Int(readLine()!)!

var dp = Array(repeating: Int.max, count: n + 1)
dp[1] = 0

if n == 1 {
    print(0)
} else {
    
    for i in 2...n {
        dp[i] = dp[i - 1] + 1
        
        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i / 2] + 1)
        }
        if i % 3 == 0 {
            dp[i] = min(dp[i], dp[i / 3] + 1)
        }
    }
    print(dp[n])
}
