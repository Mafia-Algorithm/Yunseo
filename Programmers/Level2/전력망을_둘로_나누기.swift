//1. 하나씩 끊어보기
//2. 끊긴 쪽 중 한 쪽의 송전탑 개수 세기
//3. 두 전력망의 차이 계산

import Foundation

var visitWires: [Bool] = []
var result = 0

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph = Array(repeating: [], count: n+1)
    visitWires = Array(repeating: false, count: n+1)
    
    // 그래프 정보 연결
    for i in wires {
        graph[i[0]].append(i[1])
        graph[i[1]].append(i[0])
    }
    
    func bfs(_ start: Int) -> Int{
        var count = 1
        var queue = [start]
        visitWires[start] = true

        while !queue.isEmpty {
            let wire = queue.removeFirst()
            for i in graph[wire] {
                if !visitWires[i as! Int] {
                    visitWires[i as! Int] = true
                    count += 1
                    queue.append(i as! Int)
                }
            }
        }
        return count
    }
    
    visitWires[1] = true
    let count = bfs(2)
    result = abs(count - (n-count))
    
    for i in 1...n {
        visitWires = Array(repeating: false, count: n+1)
        visitWires[i] = true                    //1. 하나씩 끊어보기
        let count = bfs(1)                        //2. 끊긴 쪽 중 한 쪽의 송전탑 개수 세기
        result = min(abs(count - (n - count)), result)      //3. 두 전력망의 차이 계산
    }

    return result
}

print(solution(7, [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]]))

