/*
 [Boj-1966]
 // https://www.acmicpc.net/problem/1966
 */

for _ in 0 ..< Int(readLine()!)! {
    var info = readLine()!.split(separator: " ").map { Int($0)! }
    var docs = readLine()!.split(separator: " ").map { Int($0)! }
    var queue = [(Int, Int)]()
    var result = 0
    
    for (index, value) in docs.enumerated() {
        queue.append((index, value))
    }
    docs.sort()
    
    while true {
        if queue[0].1 == docs.last {
            result += 1
            if queue[0].0 == info[1] {
                print(result)
                break
            } else {
                queue.removeFirst()
                docs.removeLast()
            }
        } else {
            queue.append(queue.removeFirst())
        }
    }
}

// for _ in 0..<Int(readLine()!)! {
//     let input = readLine()!.split{$0==" "}.map{Int($0)!}
//     var docs = readLine()!.split{$0==" "}.enumerated().map{($0, Int($1)!)}
//     var order = 0
//
//     while true {
//         let doc = docs.removeFirst()
//
//         if docs.contains(where: {
//             print("$0 = \($0) // doc = \(doc)")
//             print("+++")
//             return $0.1 > doc.1
//         }) {
//             docs.append(doc)
//         } else {
//             order += 1
//
//             if doc.0 == input[1] { print(order);break }
//         }
//     }
// }
