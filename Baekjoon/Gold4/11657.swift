// 11657 - 타임머신

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]

// 간선 정보 저장
var edges: [(Int, Int, Int)] = []           // 시작, 도착, 비용
for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = edge[0], end = edge[1], cost = edge[2]
    
    edges.append((start, end, cost))
}

var distance = Array(repeating: Int.max, count: N+1)

func bellmanFord(_ start: Int) -> Bool {
    distance[start] = 0
    
    for v in 0..<N {
        for (node1, node2, cost) in edges {
            if distance[node1] != Int.max && distance[node2] > distance[node1] + cost {
                distance[node2] = distance[node1] + cost
                
                if v == N-1 {           // 마지막 노드까지 최단거리가 갱신된다면 음수 사이클이 존재함
                    return true
                }
            }
        }
    }
    
    return false
}

let isCycle = bellmanFord(1)
if isCycle {                             // 음수 사이클이 존재하면 -1 출력
    print(-1)
} else {
    for i in 2..<N+1 {                  // 도달할 수 있는 최단거리 모두 출력
        if distance[i] == Int.max {
            print(-1)
        } else {
            print(distance[i])
        }
    }
}

