// 14567 - 선수과목

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]

var inDegree = Array(repeating: 0, count: N + 1)
var graph = Array(repeating: [Int](), count: N + 1)
for _ in 0..<M {
    let subject = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = subject[0], b = subject[1]
    
    graph[a].append(b)
    inDegree[b] += 1
}

/// 진입차수가 0인 노드 삽입
var answer = Array(repeating: 0, count: N+1)
var queue: [Int] = []
for i in 1...N {
    if inDegree[i] == 0 {
        queue.append(i)
        answer[i] = 1
    }
}

/// 위상정렬
var index = 0
for _ in 1...N {
    if index == queue.count {       /// 큐가 비어있다면 사이클 발생
        break
    }
    
    let currentNode = queue[index]
    for next in graph[currentNode] {
        inDegree[next] -= 1
        
        if inDegree[next] == 0 {
            queue.append(next)
            answer[next] = answer[currentNode] + 1      /// 만약 0이 되었다면 현재노드 + 1값
        }
    }
    index += 1
}

print(answer[1...].map{String($0)}.joined(separator: " "))
