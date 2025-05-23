// 1197 - 최소 스패닝 트리
// 정점 개수(1만), 간선 개수(10만)

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let v = input[0], e = input[1]
var graph = [[Int]]()

/// MST는 무방향 그래프
for _ in 0..<e {
    let path = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = path[0], b = path[1], cost = path[2]
    
    graph.append([cost, a, b])
}

/// 간선 cost가 작은 순서대로 정렬
graph.sort{ $0[0] < $1[0] }

/// 유니온 파인드
var parent: [Int] = []

for i in 0...v {
    parent.append(i)
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
    
    if px != py {
        parent[px] = py
    }
}

/// 크루스칼 알고리즘
var answer = 0
var index = 0
while index < graph.count {
    let edge = graph[index]
    let a = edge[1], b = edge[2]
    
    if find(a) != find(b) {         /// 사이클이 아니라면 union
        union(a, b)
        answer += edge[0]
    }
    
    index += 1
}

print(answer)
