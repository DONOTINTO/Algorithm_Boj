/*
 [Boj-10845]
 // https://www.acmicpc.net/problem/10845
 */

class Queue<T> {
    var queue: [T]
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    var count: Int {
        return queue.count
    }
    
    init(_ box: [T]) {
        self.queue = box
    }
    
    func enqueue(_ element: T) {
        queue.append(element)
    }
    
    func dequeue() -> T? {
        queue.isEmpty ? nil : queue.removeFirst()
    }
    
    func front() -> T? {
        return queue.first
    }
    
    func back() -> T? {
        queue.last
    }
}

let queue = Queue([Int]())

for _ in 0 ..< Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    let keyword = input[0]
    var num = 0
    if input.count == 2 { num = Int(input[1])! }
    
    switch keyword {
    case "push":
        queue.enqueue(num)
        break
    case "front":
        print(queue.front() == nil ? -1 : queue.front()!)
    case "back":
        print(queue.back() == nil ? -1 : queue.back()!)
        break
    case "empty":
        print(queue.isEmpty ? 1 : 0)
        break
    case "size":
        print(queue.count)
        break
    case "pop":
        if let a = queue.dequeue() { print(a)
        } else { print(-1) }
        break
    default: break
    }
}
