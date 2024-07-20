import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var friends: [[Int]] = Array(repeating: [], count: N)
var visit = Array(repeating: false, count: N)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    friends[input[0]].append(input[1])
    friends[input[1]].append(input[0])
}

var result = 0
func dfs(_ depth: Int, _ start: Int) {
    if depth == 5 {
        result = 1
        return
    }
    
    for f in friends[start] {
        if !visit[f] && result == 0 {
            visit[f] = true
            dfs(depth + 1, f)
            visit[f] = false
        }
    }
}


for i in 0..<N {
    if result == 1 {
        break
    }
    visit = Array(repeating: false, count: N)
    visit[i] = true
    
    dfs(1, i)
}
print(result)
