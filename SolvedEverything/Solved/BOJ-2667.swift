/*
 [Boj-2667]
 // https://www.acmicpc.net/problem/2667
 */

let n = Int(readLine()!)!
var map = [[Int]]()
var result = [Int]()

let directions = [(0, -1), (0, 1), (-1, 0), (1, 0)]

for _ in 0 ..< n {
    
    let line = readLine()!.map { Int(String($0))! }
    
    map.append(line)
}

func dfs(x: Int, y: Int) -> Int {
    
    if x < 0 || x >= n || y < 0 || y >= n || map[y][x] == 0 {
        return 0
    }
    
    map[y][x] = 0
    var size = 1
    
    for direction in directions {
        
        let newX = x + direction.0
        let newY = y + direction.1
        
        size += dfs(x: newX, y: newY)
    }
    
    return size
}

for y in 0 ..< n {
    for x in 0 ..< n {
        
        if map[y][x] == 1 {
            let size = dfs(x: x, y: y)
            result.append(size)
        }
    }
}

print(result.count)

result.sorted().forEach { print($0) }

