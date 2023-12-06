/*
 [Boj-10866]
 // https://www.acmicpc.net/problem/10845
 */

class Deque<T> {
    private var enque: [T]
    private var deque: [T] = []
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    var count: Int {
        return enque.count + deque.count
    }
    
    init(_ box: [T]) {
        self.enque = box
    }
    
    func pushFront(_ element: T) {
        deque.append(element)
    }
    
    func pushLast(_ element: T) {
        enque.append(element)
    }
    
    func popFront() -> T? {
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        return deque.popLast()
    }
    
    func popLast() -> T? {
        if enque.isEmpty {
            enque = deque.reversed()
            deque.removeAll()
        }
        return enque.popLast()
    }
    
    func front() -> T? {
        if deque.isEmpty {
            return enque.first
        }
        return deque.last
    }
    
    func back() -> T? {
        if enque.isEmpty {
            return deque.first
        }
        return enque.last
    }
}

let deque = Deque([Int]())

for _ in 0 ..< Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    let keyword = input[0]
    var num = 0
    if input.count == 2 { num = Int(input[1])! }
    
    switch keyword {
    case "push_front":
        deque.pushFront(num)
        break
    case "push_back":
        deque.pushLast(num)
        break
    case "pop_front":
        if let elem = deque.popFront() {
            print(elem)
        } else {
            print("-1")
        }
        break
    case "pop_back":
        if let elem = deque.popLast() {
            print(elem)
        } else {
            print("-1")
        }
        break
    case "front":
        print(deque.front() == nil ? -1 : deque.front()!)
    case "back":
        print(deque.back() == nil ? -1 : deque.back()!)
        break
    case "empty":
        print(deque.isEmpty ? 1 : 0)
        break
    case "size":
        print(deque.count)
        break
    default: break
    }
}
