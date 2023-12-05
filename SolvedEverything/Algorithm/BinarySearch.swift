// MARK: 이진탐색(이분탐색 - Binary Search)

//******************************************************
//                 이진탐색 특징 및 기타 내용
//******************************************************
/*
 이진 탐색은 차례대로 탐색하는 방식이 아닌 범위의 중간을 기준으로 크고 작음을 판단하여 탐색값의 범위를 줄여나가는 방식이다.
 이는 차례대로 모든 수를 탐색하지 않기 때문에 그만큼 시간(연산 횟수)이 단축된다.
 
 1. 시간복잡도 : O(log n)
 2. 탐색 배열이 오름차순 또는 내림차순으로 정렬이 되어있어야 한다.
*/

var binaryArray = [Int](0 ... 100)
var targetNumber = Int.random(in: 0 ... 100)

var start: Int = 0
var end: Int = binaryArray.count - 1

while start <= end {
    var middle = (start + end) / 2
    
    if binaryArray[middle] == targetNumber {
        print(targetNumber)
        break
    } else if binaryArray[middle] > targetNumber {
        end = middle - 1
    } else if binaryArray[middle] < targetNumber {
        start = middle + 1
    }
}
