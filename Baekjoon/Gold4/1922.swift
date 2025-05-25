// 1922 - 네트워크 연결

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var costs = [[Int]]()
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    costs.append(input)
}

costs.sort{$0[2] < $1[2]}

/// 유니온-파인드
var parent: [Int] = []
_ = (0...N).map{
    parent.append($0)
}

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    
    return parent[x]
}

func union(_ x: Int, _ y: Int) {
    let px = find(x)
    let py = find(y)
    
    parent[px] = parent[py]
}

var index = 0
var answer = 0
while index < costs.count {
    let path = costs[index]
    
    if find(path[0]) != find(path[1]) {     // 두 컴퓨터가 연결되지 않은 경우
        union(path[0], path[1])             // 컴퓨터 연결
        answer += path[2]                   // 비용 추가
    }
    
    index += 1
}

print(answer)

