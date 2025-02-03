// 12869 - 뮤탈리스크
// 2초,512MB
// scv개수 <= 3, 체력 60이하

import Foundation

let count = Int(readLine()!)!
var scv = readLine()!.split(separator: " ").map{Int(String($0))!}
let attack = [[9, 3, 1], [9, 1, 3], [3, 1, 9], [3, 9, 1], [1, 3, 9], [1, 9, 3]]
var visited = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 61), count: 61), count: 61)  // 방문횟수 저장 배열

// 무조건 3개를 입력받는 것이 아니므로 개수 맞춰줌
while scv.count != 3 {
    scv.append(0)
}

visited[scv[0]][scv[1]][scv[2]] = 0

func bfs() {
    var queue = [scv]
    
    var idx = 0
    
    while idx < queue.count {
        let now = queue[idx]

        // 체력이 모두 0 이하인 경우
        if now.allSatisfy({$0 <= 0}) {
            print(visited[now[0]][now[1]][now[2]])
            break
        }
        
        for i in 0..<6 {
            let scv1 = max(now[0] - attack[i][0], 0)
            let scv2 = max(now[1] - attack[i][1], 0)
            let scv3 = max(now[2] - attack[i][2], 0)
            
            if visited[scv1][scv2][scv3] == Int.max {       // 방문한 적이 없는 경우만
                visited[scv1][scv2][scv3] = visited[now[0]][now[1]][now[2]] + 1     // 누적합
                queue.append([scv1, scv2, scv3])
            }
        }
        
        idx += 1
    }
}

bfs()

