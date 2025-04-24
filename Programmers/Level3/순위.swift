// n명의 권투선수
// 1:1 방식으로 대결
// A가 B보다 실력이 좋다면 A는 B를 항상 이김
// 정확하게 순서를 매길 수 있는 선수의 수 return

// 1 <= n <= 100
// 1 <= 경기 결과 <= 4500
// [a, b] -> a가 b를 이겼다는 말
// 모든 결과에는 모순이 없음

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var stronger = Array(repeating: [Int](), count: n+1)
    var weaker = Array(repeating: [Int](), count: n+1)
    results.forEach {
        stronger[$0[1]].append($0[0])              // stronger[i]: i를 이기는 선수
        weaker[$0[0]].append($0[1])                // weaker[i]: i가 이기는 선수
    }
    
    var winnerCount = Array(repeating: 0, count: n+1)       // i에게 이기는 선수의 수
    var loserCount = Array(repeating: 0, count: n+1)        // i에게 지는 선수의 수
    
    var checked = Array(repeating: false, count: n+1)
    func bfs(_ start: Int, _ graph: [[Int]]) -> Int {
        var queue = [start]
        var index = 0
        var count = 0
        checked = Array(repeating: false, count: n+1)
        checked[start] = true
        
        while index < queue.count {
            let player = queue[index]
            
            for winner in graph[player] {
                if !checked[winner] {
                    checked[winner] = true
                    count += 1
                    queue.append(winner)
                }
            }
            
            index += 1
        }
        return count
    }
    
    // i를 이기는 선수, i에게 지는 선수의 수를 구함
    for i in 1...n {
        winnerCount[i] = bfs(i, stronger)
        loserCount[i] = bfs(i, weaker)
    }
    
    // i를 이기는 선수와 지는 선수의 합 == 전체 선수 -1 이면 정확한 순위를 알 수 있음
    let answer = (1...n).filter{ winnerCount[$0] + loserCount[$0] + 1 == n}.count
    return answer
}
