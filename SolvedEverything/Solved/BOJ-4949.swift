/*
 [Boj-4949]
 // https://www.acmicpc.net/problem/4949
 */

while let a = readLine(), a != "." {
    var n = [Character]()
    
    a.forEach {
        if $0 == "(" || $0 == "[" { n.append($0) }
        
        if $0 == ")" {
            if n.last == "(" { n.removeLast()
            } else { n.append("0") }
        }
        
        if $0 == "]" {
            if n.last == "[" { n.removeLast()
            } else { n.append("0") }
        }
    }
    print(n.isEmpty ? "yes" : "no")
}
