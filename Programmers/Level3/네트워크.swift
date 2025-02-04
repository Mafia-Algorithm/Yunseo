import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var network = 0
    var visited = Array(repeating: false, count: n)
    
    func bfs(_ start: Int) {
        var queue: [Int] = [start]
        var index = 0
        visited[start] = true
        
        while index < queue.count {
            let now = queue[index]
            
            for (i, c) in computers[now].enumerated() {
                if !visited[i] && c == 1 {      // 방문한 적 없고 연결되어 있는 경우
                    visited[i] = true           // 컴퓨터 번호 i, 연결 여부 c
                    queue.append(i)
                }
            }
            index += 1
        }
    }
    
    for i in 0..<n {
        if !visited[i] {        // 방문한 적이 없는 컴퓨터만 확인
            bfs(i)
            network += 1
        }
    }
    
    return network
}
