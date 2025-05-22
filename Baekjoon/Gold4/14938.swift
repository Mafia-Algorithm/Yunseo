// 14938 - 서강그라운드
// 얻을 수 있는 아이템의 최대 개수 -> 각 지점에 낙하했을 때 얻을 수 있는 아이템 개수를 전수 조사 해야함
// O(100^3) -> O(100만)

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let V = input[0], M = input[1], E = input[2]
var items = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
var graph = Array(repeating: Array(repeating: Int.max, count: V+1), count: V+1)

/// 자기 자신으로 가는 길 초기화
_ = (1...V).map {
    graph[$0][$0] = 0
}

/// 노드 간 거리 정보 업데이트
for _ in 0..<E {
    let path = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = path[0], b = path[1], length = path[2]
    
    graph[a][b] = length
    graph[b][a] = length
}

/// 플로이드 워셜
for middle in 1...V {
    for start in 1...V {
        for end in 1...V {
            if graph[start][middle] < Int.max && graph[middle][end] < Int.max {
                graph[start][end] = min(graph[start][end], graph[start][middle] + graph[middle][end])
            }
        }
    }
}

/// O(N^2)
var maxItems = 0
for node in 1...V {
    var temp = 0
    for i in 1..<graph[node].count {
        if graph[node][i] <= M {
            temp += items[i]
        }
    }
    maxItems = max(maxItems, temp)
}

print(maxItems)

