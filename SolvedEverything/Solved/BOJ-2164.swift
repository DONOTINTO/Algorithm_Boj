/*
 [Boj-2164]
 // https://www.acmicpc.net/problem/2164
 */

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

var a = Queue([Int](1...Int(readLine()!)!))

while a.count != 1 {
    a.dequeue()
    a.enqueue(a.dequeue()!)
}

print(a.dequeue()!)
