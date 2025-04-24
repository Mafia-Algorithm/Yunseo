// n개의 섬 사이, 다리를 건설하는 비용
// 최소 비용으로 모든 섬이 서로 통행 가능하도록
// 최소 비용 return

// 1 <= 섬 <= 100
// costs ((n-1) * n) / 2  (최대 경우: 모든 섬을 연결하는 경우)

// 최소 신장 트리를 구하는 문제 !! 

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var costs = costs.sorted{ $0[2] < $1[2] }       // 최소비용 순으로 정렬(그리디)
    
    // 유니온 파인드(선택한 간선으로 이루어진 신장 트리)
    var parent = (0..<n).map{Int(String($0))!}
    
    func find(_ x: Int) -> Int {       // x의 부모 찾기
        if parent[x] != x {     // 자기 자신이 루트가 아닌 경우
            parent[x] = find(parent[x])     // 부모의 루트가 내 루트가 됨
        }
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) {        // x와 y의 부모를 일치 시킴
        let xRoot = find(x)
        let yRoot = find(y)
        
        parent[xRoot] = yRoot
    }
    
    // 크루스칼 알고리즘
    var answer = 0                          // 사용되는 비용
    var index = 0                           // 현재 간선
    var count = 1                           // 연결된 노드 개수
    while count <= n-1 {                    // 연결된 노드 개수가 n-1개인 동안 반복
        let info = costs[index]
        let node1 = info[0]
        let node2 = info[1]
        let dist = info[2]
        
        if find(node1) != find(node2) {     // 신장 트리가 아닌 경우
            union(node1, node2)             // 간선 연결
            answer += dist                  // 비용 계산
            count += 1                      // 선택된 노드 개수
        }
        
        index += 1
    }
    
    return answer
}
