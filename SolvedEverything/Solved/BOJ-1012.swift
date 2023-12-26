/*
 [Boj-1012]
 // https://www.acmicpc.net/problem/1012
 */

for _ in 0 ..< Int(readLine()!)! {
    var count = 0
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let width = input[0]
    let height = input[1]
    //map 생성
    var arr: [[Int]] = .init(repeating: .init(repeating: 0, count: width), count: height)

    for _ in 0 ..< input[2] {
        let coor = readLine()!.split(separator: " ").map { Int($0)! }
        let x = coor.first!
        let y = coor.last!
        
        arr[y][x] = 1
    }
    
    func dfs(_ x: Int,_ y: Int) {
        if x < 0 || x >= width || y < 0 || y >= height {
            return
        }
        
        //1일 경우 해당 좌표를 0으로 바꿔주고 네 방향으로 탐색 시작
        if arr[y][x] == 1 {
            arr[y][x] = 0
            dfs(x - 1, y)
            dfs(x + 1, y)
            dfs(x, y - 1)
            dfs(x, y + 1)
        }
    }
    
    for y in 0 ..< height {
        for x in 0 ..< width {
            if arr[y][x] == 1 {
                dfs(x, y)
                count += 1
            }
        }
    }
    print(count)
}
