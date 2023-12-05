//이진탐색(이분탐색)
//시간복잡도 : O(log n)
//Tip. 특정 수를 찾아야하는 배열이 오름차순 또는 내림차순으로 정렬이 되어있어야 한다.

// 정렬이 되어 있지 않다면 정렬 필수
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
