// 1967 - 트리의 지름
// 트리의 가장 긴 지름 구하는 법 : DFS로 매 순간 가장 먼 path를 찾아가기
// N <= 1만

/// 메모리 초과
/// 만약 인접 행렬로 구현하면 10000 * 10000 = 100,000,000 = 1억
/// 크기는 8byte * 1억 = 8억 byte = 8GB가 됨
/// 인접 리스트는 최대 80,000Byte로 80KB만 소요

import Foundation

let N = Int(readLine()!)!

/// 그래프 구성
var graph = Array(repeating: [(Int, Int)](), count: N+1)
for _ in 0..<N-1 {
    let path = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = path[0], b = path[1], cost = path[2]
    
    graph[a].append((b, cost))
    graph[b].append((a, cost))
}

var dist = Array(repeating: Int.max, count: N+1)

func bfs(_ start: Int) {
    var queue: [Int] = [start]
    dist[start] = 0
    var index = 0
    
    while index < queue.count {
        let currentNode = queue[index]
        
        for (nextNode, cost) in graph[currentNode] {
            if dist[nextNode] > dist[currentNode] + cost {
                dist[nextNode] = dist[currentNode] + cost
                queue.append(nextNode)
            }
        }
        index += 1
    }
}

/// 루트 노드 1에서 가장 먼 노드 구하기
bfs(1)
var maxNode = 1
for (i, d) in dist.enumerated() where d != Int.max {
    if d > dist[maxNode] {
        maxNode = i
    }
}

/// 루트에서 가장 먼 노드를 기준으로 가장 먼 노드 구하기 -> 지름
dist = Array(repeating: Int.max, count: N+1)
bfs(maxNode)
print(dist.filter{$0 != Int.max}.max()!)
