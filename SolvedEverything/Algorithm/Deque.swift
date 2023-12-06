
// MARK: 데크 스택(Deque)

//******************************************************
//                 Deque 특징 및 기타 내용
//******************************************************
/*
 1. 양방향 Queue로 O(1)의 시간복잡도를 가지고 앞, 뒤로 데이터를 추가, 삭제할 수 있음
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
    
    init(_ collection: [T]) {
        self.enque = collection
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
    
    func contains(_ elem: T) -> Bool {
        return enque.contains(elem) || deque.contains(elem)
    }
}

let deque = Deque([Int]())
