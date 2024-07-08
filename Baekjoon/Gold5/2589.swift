// 2589 - 보물섬(1초, 512MB)

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let row = input[0], col = input[1]
let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

var answer: [Int] = []
var map: [[String]] = []

// 지도 정보 입력
for _ in 0..<row {
    map.append(readLine()!.map{String($0)})
}

/// L일 때 수행
for r in 0..<row {
    for c in 0..<col {
        if map[r][c] == "L" {
            answer.append(bfs(r, c))
        }
    }
}

/// 최단 거리 구하는 함수
func bfs(_ y: Int, _ x: Int) -> Int {
    var visit = Array(repeating: Array(repeating: false, count: col), count: row)
    visit[y][x] = true
    
    
    var queue: [(Int, Int, Int)] = [(y, x, 0)]                  // y좌표, x좌표, 최단거리
    var result = 0
    var index = 0
    
    while index < queue.count {
        let now = queue[index]
        
        for i in 0..<4 {
            let ny = now.0 + dy[i]
            let nx = now.1 + dx[i]
            
            // contains보다 ~=가 100ms 더 빠름
            if 0..<row ~= ny && 0..<col ~= nx && map[ny][nx] == "L" && !visit[ny][nx] {
                visit[ny][nx] = true
                queue.append((ny, nx, now.2 + 1))
            }
        }
        index += 1
    }
    return queue.last!.2
}

/// 최단거리 중 가장 큰 값
print(answer.max()!)

