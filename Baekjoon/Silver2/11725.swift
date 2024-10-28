// 11725 - 트리의 부모 찾기
// 노드의 개수: N(2<=N<=100,000)
// N-1개 줄에 트리 상에서 연결된 두 정점이 주어짐.

import Foundation

let N = Int(readLine()!)!                                       // 노드개수
var nodes: [[Int]] = Array(repeating: [Int](), count: N+1)      // 노드 간 연결 정보
var used = [true] + Array(repeating: false, count: N)           // 노드 탐색 여부

// 정보 입력
for _ in 1..<N {
    let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    nodes[relation[0]].append(relation[1])
    nodes[relation[1]].append(relation[0])
}

var answer: [Int] = Array(repeating: 0, count: N)

func bfs() {
    var queue: [Int] = [1]
    used[1] = true
    
    var index = 0
    while index < queue.count {
        let parent = queue[index]
        used[parent] = true
        
        for n in nodes[parent] {
            if used[n] { continue }             // 이미 확인한 노드인 경우 continue
            answer[n-1] = parent                // 그렇지 않으면 부모 노드 저장
            queue.append(n)
        }
        
        index += 1
    }
}

bfs()
answer[1...].forEach{ print($0) }
