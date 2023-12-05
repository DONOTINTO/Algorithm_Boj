//T는 타입을 나타냄
//Queue 스택 구현
class Queue<T> {
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
