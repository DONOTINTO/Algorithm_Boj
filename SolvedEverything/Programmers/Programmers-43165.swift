/*
[Link]
https://school.programmers.co.kr/learn/courses/30/lessons/43165
 */

import Foundation
 
func solution43165(_ numbers:[Int], _ target:Int) -> Int {
    
    var count = 0
    
    func dfs(idx: Int, sum: Int) {
        if idx == numbers.count && sum == target {
            count += 1
            return
        }
        
        if idx + 1 <= numbers.count {
            dfs(idx: idx + 1, sum: sum + numbers[idx])
            dfs(idx: idx + 1, sum: sum - numbers[idx])
        }
    }
    
    dfs(idx: 0, sum: 0)
    
    return count
}

