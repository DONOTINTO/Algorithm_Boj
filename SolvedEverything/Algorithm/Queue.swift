
// MARK: 큐 스택(Queue)

//******************************************************
//                 Queue 특징 및 기타 내용
//******************************************************
/* 
 1. FIFO(First In First Out)
 2. T는 Generic으로 타입을 나타냄
    - Generic으로 정의된 <T> 자리에는 어떠한 타입도 올 수 있음
 3. enqueue : 맨 뒤에 원소를 추가함
 4. dequeue : 맨 앞의 원소를 삭제함
 5. removeFirst를 하지 않고 reversed를 통해 pop을 하는 이유
    - removeFirst는 삭제 후 배열을 앞으로 당기는 작업이 추가되기 때문에 O(n)의 시간복잡도를 가지는 반면 reversed는 O(1)의
    시간복잡도를 가지고 있어 훨씬 효율적임
*/

fileprivate class Queue<T> {
    private var inbox: [T]
    private var outbox: [T] = []
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var count: Int {
        return inbox.count + outbox.count
    }
    
    init(_ input: [T]) {
        inbox = input
    }
    
    func enqueue(_ input: T) {
        inbox.append(input)
    }
    
    func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}
