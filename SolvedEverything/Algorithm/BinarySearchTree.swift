// MARK: 이진트리탐색(Binary Search Tree)

//******************************************************
//                이진트리탐색 특징 및 기타 내용
//******************************************************
/*
 트리란? 
 - Node와 Branch를 이용해서, 사이클을 이루지 않도록 구성한 데이터 구조
 - 순차적 나열 구조가 아닌 상위 노드를 기준으로 왼쪽/오른쪽에 자식 노드로 연결되는 비선형 구조
 
 노드란? 
 - 내 데이터 + 다음 데이터의 주소값을 갖고 있는 형태
 - Root Node: 트리 최상위 노드
 - Parent Node: 어떤 노드의 상위 레벨에 연결된 노드
 - Chile Node: 어떤 노드의 하위 레벨에 연결된 노드
 - Leaf Node: 하위 레벨에 연결된 노드가 없는 노드, 즉 Child Node가 존재하지 않는 노드
 - Level: 노드의 깊이
 - Depth: 트리에서 Node가 가질 수 있는 최대 Level
 
 브랜치란?
 - 상위(부모) 노드와 자식 노드를 가리키는 선(연결)
 
 이진트리란?
 - 하나의 노드에 최대 2개의 노드까지만 연결된 트리
 - 노드의 데이터 값은 유일
*/

class Node<T: Comparable> {
    var data: T
    var left: Node?
    var right: Node?
    
    init(data: T) {
        self.data = data
    }
}

class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    // MARK: Search
    func search(from data: T) -> Bool {
        if root == nil { return false }
        
        var currentNode = root
        while let node = currentNode {
            if node.data == data { return true }
            
            if node.data > data { currentNode = node.left }
            else { currentNode = node.right }
        }
        return false
    }
    
    // MARK: Insert
    func insert(_ data: T) {
        // 이미 존재하는 data라면 종료
        if self.search(from: data) { return }
        
        guard let root = self.root else {
            return self.root = Node.init(data: data)
        }
        
        var currentNode = root
        while true {
            if currentNode.data > data {
                guard let nextNode = currentNode.left else {
                    return currentNode.left = Node.init(data: data)
                }
                currentNode = nextNode
            } else {
                guard let nextNode = currentNode.right else {
                    return currentNode.right = Node.init(data: data)
                }
                currentNode = nextNode
            }
        }
    }
    
    func remove(from data: T) -> Bool {
        guard let root = self.root else { return false }
        
        var parentNode = root
        var currentNode: Node? = root
        
        // MARK: 삭제할 노드 탐색
        while let node = currentNode {
            if node.data == data { break }
            
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
            parentNode = node
        }
        
        guard let deleteNode = currentNode else {
            return false
        }
        
        // MARK: 1. Leaf Node(자식이 없는 노드)의 경우
        if deleteNode.left == nil && deleteNode.right == nil {
            if parentNode.data > data {
                parentNode.left = nil
            } else {
                parentNode.right = nil
            }
            return true
        }
        
        // MARK: 2. Child Node가 한 개인 경우
        // 왼쪽에 Child Node가 있는 경우
        // delete Node의 left 값을 parentNode의 left 또는 right로 연결해준다.
        if deleteNode.left != nil && deleteNode.right == nil {
            if parentNode.data > data {
                parentNode.left = deleteNode.left
            } else {
                parentNode.right = deleteNode.right
            }
            return true
        }
        
        if deleteNode.left == nil && deleteNode.right != nil {
            if parentNode.data > data {
                parentNode.left = deleteNode.right
            } else {
                parentNode.right = deleteNode.right
            }
            return true
        }
        
        // MARK: 3. Child Node가 두 개인 경우
        // change node = 삭제할 노드의 오른쪽 노드 중 가장 작은 값 -> 이 값을 삭제할 노드 자리로 교체할 것임
        // change parent node = change node에 right node가 있을 경우 해당 right node는 change parent node로 연결
        
        guard let rightNode = deleteNode.right else { return false }
        
        var changeNode = rightNode
        var changeParentNode = rightNode
        
        // change node, change parent node 구하기
        while let nextNode = changeNode.left {
            changeParentNode = changeNode
            changeNode = nextNode
        }
        
        // change node의 right node가 있는 경우 해당 right node를 change parent node의 left로 연결한다.
        // change parent node의 left가 change node였기 때문에 가능 (change node는 delete node 자리로 이동하기 때문)
        if let changeChildRightNode = changeNode.right {
            changeParentNode.left = changeChildRightNode
        } else {
            changeParentNode.left = nil
        }
        
        // change node를 delete node 대신 연결
        if parentNode.data > data {
            parentNode.left = changeNode
        } else {
            parentNode.right = changeNode
        }
        
        // delete node와 branch(연결)되어 있는 childe node들도 change node의 child node로 연결
        changeNode.left = deleteNode.left
        changeNode.right = deleteNode.right
        
        return true
    }
}

extension BinarySearchTree {
    func drawDiagram() {
        print(diagram(for: self.root))
    }
     
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
       guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

let BST: BinarySearchTree<Int> = BinarySearchTree()

BST.insert(35)
BST.insert(10)
BST.insert(40)
BST.insert(7)
BST.insert(30)
BST.insert(25)
BST.insert(32)
BST.insert(16)
BST.insert(28)
BST.insert(34)
BST.insert(18)
BST.drawDiagram()
BST.remove(from: 10)
BST.drawDiagram()
