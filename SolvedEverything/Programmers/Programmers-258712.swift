/*
 MARK: 2024 카카오 인텁쉽 1번 문제
 [Programmers-258712]
 선물을 직접 전하기 힘들 때 카카오톡 선물하기 기능을 이용해 축하 선물을 보낼 수 있습니다. 당신의 친구들이 이번 달까지 선물을 주고받은 기록을 바탕으로 다음 달에 누가 선물을 많이 받을지 예측하려고 합니다.

 두 사람이 선물을 주고받은 기록이 있다면, 이번 달까지 두 사람 사이에 더 많은 선물을 준 사람이 다음 달에 선물을 하나 받습니다.
 예를 들어 A가 B에게 선물을 5번 줬고, B가 A에게 선물을 3번 줬다면 다음 달엔 A가 B에게 선물을 하나 받습니다.
 두 사람이 선물을 주고받은 기록이 하나도 없거나 주고받은 수가 같다면, 선물 지수가 더 큰 사람이 선물 지수가 더 작은 사람에게 선물을 하나 받습니다.
 선물 지수는 이번 달까지 자신이 친구들에게 준 선물의 수에서 받은 선물의 수를 뺀 값입니다.
 예를 들어 A가 친구들에게 준 선물이 3개고 받은 선물이 10개라면 A의 선물 지수는 -7입니다. B가 친구들에게 준 선물이 3개고 받은 선물이 2개라면 B의 선물 지수는 1입니다. 만약 A와 B가 선물을 주고받은 적이 없거나 정확히 같은 수로 선물을 주고받았다면, 다음 달엔 B가 A에게 선물을 하나 받습니다.
 만약 두 사람의 선물 지수도 같다면 다음 달에 선물을 주고받지 않습니다.
 위에서 설명한 규칙대로 다음 달에 선물을 주고받을 때, 당신은 선물을 가장 많이 받을 친구가 받을 선물의 수를 알고 싶습니다.

 친구들의 이름을 담은 1차원 문자열 배열 friends 이번 달까지 친구들이 주고받은 선물 기록을 담은 1차원 문자열 배열 gifts가 매개변수로 주어집니다. 이때, 다음달에 가장 많은 선물을 받는 친구가 받을 선물의 수를 return 하도록 solution 함수를 완성해 주세요.
 
 [Link]
 https://school.programmers.co.kr/learn/courses/30/lessons/258712
 
 */

import Foundation

func solution258712(_ friends:[String], _ gifts:[String]) -> Int {
 
    //선물 지수
    var giftPoint: [String: Int] = [:]
    //주고 받은 횟수
    var giftTimes: [[Int]] = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    //결과
    var result: [Int] = Array(repeating: 0, count: friends.count)
    
    // 선물 지수 초기화
    friends.forEach { giftPoint[$0] = 0 }
    
    gifts.forEach {
        
        let logs = $0.split(separator: " ").map { String($0) }
        let give: String = logs[0]
        let get: String = logs[1]
        
        // 선물 지수
        giftPoint[give]! += 1
        giftPoint[get]! -= 1
        
        let giveIdx = friends.firstIndex(of: give)!
        let getIdx = friends.firstIndex(of: get)!
        
        // 주고 받은 횟수 추가
        giftTimes[giveIdx][getIdx] += 1
    }
    
    for i in 0 ..< friends.count {
        for j in i ..< friends.count {
            
            if i == j { continue }
            
            let giveMemberPt = giftPoint[friends[i]]!
            let getMemberPt = giftPoint[friends[j]]!
            
            // 상대보다 선물 횟수가 많으면 + 1
            if giftTimes[i][j] > giftTimes[j][i] {
                result[i] += 1
            // 상대가 선물 횟수가 많으면 상대 + 1
            } else if giftTimes[i][j] < giftTimes[j][i] {
                result[j] += 1
            // 상대와 선물 횟수가 동일하고, 상대보다 선물 지수가 높으면 + 1
            } else if giftTimes[i][j] == giftTimes[j][i], giveMemberPt > getMemberPt {
                result[i] += 1
            // 상대와 선물 횟수가 동일하고, 상대가 선물 지수가 높으면 상대 + 1
            } else if giftTimes[i][j] == giftTimes[j][i], getMemberPt > giveMemberPt {
                result[j] += 1
            }
        }
    }
    
    return result.max()!
}
