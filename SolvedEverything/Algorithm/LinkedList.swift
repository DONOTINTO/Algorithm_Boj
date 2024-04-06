// MARK: 링크드리스트(Linked List)

//******************************************************
//                 Linked List 특징 및 기타 내용
//******************************************************
/*
 - 노드가 데이터와 포인터를 가지고 한 줄로 연결되어 있는 방식으로 데이터를 저장하는 자료구조
 - 임의의 위치 k번째 원소 확인/수정 O(n)
 - 임의의 위치 k번째 원소 추가/삭제 O(n) / O(1)
 */

import Foundation

final class Node<T: Equatable> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs.value == rhs.value && lhs.next == rhs.next
    }
}

/// 구현의 편의를 위해서 LinkedList의 Node에는 중복되는 값이 없다고 가정
struct LinkedList<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    private var isEmpty: Bool {
        head == nil
    }
    
    func showList() {
        var cur = head
        print("===== Linked List ======")
        while cur != nil {
            cur?.next == nil
            ? print("data: \(cur!.value)")
            : print("data: \(cur!.value) -> ")
            cur = cur?.next
        }
        print("========================")
    }
}

extension LinkedList {
    /// 임의의 노드를 찾는 과정
    /// - Complexity: O(N)
    private func search(_ findValue: T) -> Node<T>? {
        var cur = head
        while cur?.value != findValue && cur?.next != nil {
            cur = cur?.next
        }
        return cur
    }
    
    /// 임의의 노드의 이전 노드를 찾는 과정 : insert, remove 로직의 편의성을 위해
    /// - Complexity: O(N)
    private func searchBefore(_ findValue: T) -> Node<T>? {
        var cur = head
        if cur?.value == findValue { return cur }
        while cur?.next?.value != findValue && cur?.next != nil  {
            cur = cur?.next
        }
        return cur
    }
}

extension LinkedList {
    /// Head가 가리키는 곳(=첫번째 위치) 데이터 추가
    ///  - Complexity: O(1)
    mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Tail이 가리키는 곳(=마지막 위치) 데이터 추가
    /// - Complexity: 이전 노드의 next를 바꾸는 과정 O(1)
    mutating func append(_ value: T) {
        if isEmpty {
            push(value)
        } else {
            tail!.next = Node(value: value)
            tail = tail!.next
        }
    }
    
    /// 임의의 위치(노드) 앞 데이터 추가
    /// - Complexity: 임의의 위치의 노드를 찾는 과정 O(N) + 이전 노드의 next를 바꾸는 과정 O(1)
    mutating func insert(_ value: T, _ findValue: T) {
        if let destination = searchBefore(findValue) {
            if destination == head {
                push(value)
            } else {
                let node = Node(value: value, next: destination.next)
                destination.next = node
            }
        }
    }
    
    /// 임의의 위치 데이터 삭제
    /// - Complexity: 임의의 위치의 노드를 찾는 과정 O(N) + 이전 노드의 next를 바꾸는 과정 O(1)
    @discardableResult
    mutating func remove(_ findeValue: T) -> Node<T>? {
        if let cur = head {
            // 삭제하고자 하는 노드가 첫번째 head가 가리키는 노드인 경우
            if cur.value == findeValue {
                if head == tail { tail = nil } // 데이터가 하나밖에 없는 경우
                head = cur.next
                return cur
            } else {
                if let destination = searchBefore(findeValue) {
                    if destination.next == tail { // 마지막 데이터를 삭제하는 경우
                        tail = destination
                    }
                    defer { destination.next = destination.next?.next }
                    return destination.next
                } else { // 삭제하고자 하는 노드를 찾지 못한 경우
                    return nil
                }
            }
        } else {
            return nil
        }
    }
}

