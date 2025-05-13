// 2206 - 벽 부수고 이동하기

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let height = input[0], width = input[1]
var graph: [[Int]] = [[]]

let dy = [0, 0, 1, -1]
let dx = [1, -1, 0, 0]

for _ in 1...height {
    let temp = readLine()!.map{Int(String($0))!}
    graph.append([0] + temp)
}

/// 최단 거리를 저장하는 배열,  벽을 부수지 않은 경우 0, 벽을 부순 경우 1로 구분하여 3차원 배열로 만듦
var dist = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 2), count : width + 1), count: height + 1)

func bfs(_ y: Int, _ x: Int) {
    var queue = [[y, x, 0]]
    dist[y][x][0] = 1
    var index = 0
    
    while index < queue.count {
        let now = queue[index]
        
        for i in 0..<4 {
            let ny = now[0] + dy[i]
            let nx = now[1] + dx[i]
            let broken = now[2]
            
            if ny < 1 || ny > height || nx < 1 || nx > width { continue }       // 범위를 벗어나는 경우 return
            
            // 벽이 아니고 첫 방문인 경우, broken의 상태를 유지하며 다음 경로 탐색
            if graph[ny][nx] == 0 && dist[ny][nx][broken] == Int.max {
                dist[ny][nx][broken] = dist[now[0]][now[1]][broken] + 1
                queue.append([ny, nx, broken])
            }
            
            // 벽이고 벽을 부술 수 있는 횟수가 남아있는 경우, 벽을 부수며 다음 경로 탐색
            if graph[ny][nx] == 1 && dist[ny][nx][broken] == Int.max && broken == 0 {
                dist[ny][nx][1] = dist[now[0]][now[1]][broken] + 1
                queue.append([ny, nx, 1])
            }
        }
        
        index += 1
    }
}

bfs(1, 1)
print(dist[height][width].min()! != Int.max ? dist[height][width].min()! : -1)


/// 시간 복잡도 O(NM)임
/// 각 칸의 개수 = N*M에 상태는 2개이므로 2*N*M
/// BFS에서 4방향을 검사하므로 2NM * 4 = 8NM

