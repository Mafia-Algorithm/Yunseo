// 1. output이 더 많은 노드가 추가된 노드
// 2. 도넛 모양 그래프: 중간 노드 - 막대 개수 - 8자 개수
// 3. 막대 그래프: 진출 차수 0인게 반드시 존재
// 4. 8자 그래프: 진입차수 == 2이상, 진출차수 == 2

import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    let maxNode = edges.flatMap{ $0 }.max()!
    
    // 노드간 진입, 진출 정보 저장
    var input = Array(repeating: 0, count: maxNode + 1)
    var output = Array(repeating: 0, count: maxNode + 1)
    
    edges.forEach {
        input[$0[1]] += 1
        output[$0[0]] += 1
    }
    
    // 중간 노드 찾기
    var newNode = 0
    for node in 1...maxNode {
        if output[node] >= 2 && input[node] == 0 {
            newNode = node
            break
        }
    }
    
    // 그래프 종류 찾기
    var donut = 0
    var stick = 0
    var eight = 0
    
    for node in 1...maxNode {
        if node == newNode { continue }
        if input[node] >= 2 && output[node] == 2 {          // 진입 노드 2이상, 진출노드 2(8의 중심)
            eight += 1
        } else if output[node] == 0 && input[node] != 0 {   // 진출 0개가 막대 그래프의 끝
            stick += 1
        }
    }
    
    donut = output[newNode] - (stick + eight)               // 전체 중심 개수 - (막대, 8자 개수)
    
    return [newNode, donut, stick, eight]
}
