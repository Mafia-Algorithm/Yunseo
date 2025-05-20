// 18352 - 특정 거리의 도시 찾기
// 도시 개수 N(30만), 간선 개수 (100만) -> 130만 ,, 2초안에 가능할까 ? -> 가능! 1초에 1억이라고 생각

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], K = input[2], X = input[3]
var graph = Array(repeating: [Int](), count: N+1)

for _ in 0..<M {
    let path = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = path[0], b = path[1]
    graph[a].append(b)
}

var dist = Array(repeating: Int.max, count: N+1)
var visit = Array(repeating: false, count: N+1)

func bfs(_ start: Int) {
    var queue = [start]
    dist[start] = 0
    
    var index = 0
    
    while index < queue.count {
        let currentNode = queue[index]
        visit[currentNode] = true
        
        for next in graph[currentNode] {
            if !visit[next] && dist[next] > dist[currentNode] + 1 {
                dist[next] = dist[currentNode] + 1
                queue.append(next)
            }
        }
        index += 1
    }
}
bfs(X)

var answer = dist.enumerated().filter{$0.element == K}.map{String($0.offset)}
if answer.isEmpty {
    print(-1)
} else {
    answer.forEach {
        print($0)
    }
}
