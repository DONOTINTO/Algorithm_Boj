/*
 [Boj-9012]
 // https://www.acmicpc.net/problem/9012
 */

for _ in 0 ..< Int(readLine()!)! {
    let input = readLine()!
    var count = 0
    
    for key in input {
        key == "(" ? (count += 1) : (count -= 1)
        if count < 0 { break }
    }
    count == 0 ? print("YES") : print("NO")
}
