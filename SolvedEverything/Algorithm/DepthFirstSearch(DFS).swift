// MARK: 깊이우선탐색 DFS(Depth First Search)

//******************************************************
//                   DFS 특징 및 기타 내용
//******************************************************
/*
 그래프란?
 - 여러 노드와 간선으로 연결된 네트워크 또는 자료구조
 - 그래프(G)는 노드(Vertex)와 간선(Edge)로 이루어짐 G = (V,E)
 
 그래프의 종류
 - 무방향/방향 그래프 : 간선에 방향이 있거나 없음
 - 가중치 그래프 : 간선에 가중치(Cost)가 발생
 - 완전 그래프 : 모든 노드가 연결됨
 
 깊이우선탐색이란?
 - 그래프에서 깊은 부분을 우선적으로 탐색하는 알고리즘
 - 시작점부터 인접한 노드의 자식 노드들까지 완전히 탐색 후 다음 노드를 탐색
 
 탐색방법
 1. 방문이 필요한 노드(needVisit)를 저장하는 배열과 이미 방문한 노드(visited)를 저장하는 Bool타입 배열 두가지를 생성한다.
 2. 출발점부터 인접한 노드를 needVisit 스택에 쌓는다.
 3. 방문한 노드는 visited 노드에 true로 저장한다.
 4. needVisit에서 마지막 스택을 꺼내와 방문한다.
 5. 다시 2번을 반복한다.
 
 위 탐색 방법은 방문할 노드들을 차레로 계속 스택으로 쌓아 가장 마지막으로 들어온 노드부터 방문하여 LIFO 방식으로 구현할 수 있다.
*/

import Foundation

// 인접 리스트
var graph = [
    [],
    [2,3],    //1번 노드와 인접한 노드
    [1,4,5],      //2번 노드와 인접한 노드
    [1,6,7],    //3번 노드와 인접한 노드
    [2],      //4번 노드와 인접한 노드
    [2],      //5번 노드와 인접한 노드
    [3],        //6번 노드와 인접한 노드
    [3,8],    //7번 노드와 인접한 노드
    [7]       //8번 노드와 인접한 노드
]

var visited = [Bool].init(repeating: false, count: graph.count)
var needVisit = [Int]()

func dfs(start: Int) {
    //방문한 노드는 true로 변경
    visited[start] = true
    print(start, terminator: " ")
    
    //방문한 노드와 인접한 노드들을 방문할 노드에 추가
    for adjacent in graph[start] {
        //이미 방문한 노드라면 방문할 노드에서 제외
        if !visited[adjacent] {
            needVisit.append(graph[start].removeLast())
        }
    }
    
    //방문할 노드가 없을 때까지 반복(재귀)
    while !needVisit.isEmpty {
        //다음 방문할 노드는 가장 마지막에 저장한 노드여야 깊이 우선 탐색이 가능
        let nextNode = needVisit.popLast()!
        //다음 노드를 탐색(방문)
        dfs(start: nextNode)
    }
}

// dfs(start: 1)


//인접 리스트를 통해 연결된 다음 노드를 알고 있기 떄문에 따로 willVisit 스택을 생성하지 않고 진행
func dfsSimpleVer(start: Int) {
    visited[start] = true
    print(start, terminator: " ")
    
    for nextNode in graph[start] {
        if !visited[nextNode] {
            dfsSimpleVer(start: nextNode)
        }
    }
}

dfsSimpleVer(start: 1)
