// 2252 - 줄 세우기

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var inDegree = [Int](repeating: 0, count: N+1)
var graph = Array(repeating: [Int](), count: N+1)
var answer: [Int] = []

for _ in 0..<M {
    let students = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = students[0], b = students[1]
    
    graph[a].append(b)
    inDegree[b] += 1
}

var queue = [Int]()
var index = 0

for i in 1...N {
    if inDegree[i] == 0 {       /// 진입차수가 0인 노드를 큐에 담는다.
        queue.append(i)
    }
}
 
/// 위상정렬은 N번만 실행
for _ in 1...N {
    if index == queue.count {   /// 큐가 비어있으면 사이클 발생
        break
    }
    
    let currentNode = queue[index]
    answer.append(currentNode)
    
    for next in graph[currentNode] {
        inDegree[next] -= 1     /// 진입차수 - 1
        
        if inDegree[next] == 0 {    /// 진입차수가 0인 노드를 다시 큐에 삽입
            queue.append(next)
        }
    }
    index += 1
}

print(answer.map{String($0)}.joined(separator: " "))

