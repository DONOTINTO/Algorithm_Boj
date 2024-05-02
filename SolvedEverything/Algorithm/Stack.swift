//
//  Stack.swift
//  SolvedEverything
//
//  Created by 이중엽 on 4/16/24.
//

// MARK: 스택(Stack)

//******************************************************
//                 Stack 특징 및 기타 내용
//******************************************************
/*
 1. 한 쪽 끝에서만 자료를 넣고 뺄 수 있는 LIFO, FILO 형식의 자료구조
*/

import Foundation

struct Stack<T> {
    private var elements: [T] = []
    init() { }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    mutating func peek() -> T? {
        return elements.last
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
}
