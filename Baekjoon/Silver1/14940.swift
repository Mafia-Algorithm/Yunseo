// 14940 - 쉬운 최단거리

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]        // 세로
let m = input[1]        // 가로
var area: [[Int]] = Array(repeating: [Int](), count: n)                         // 지도
var visit = Array(repeating: Array(repeating: false, count: m), count: n)   // 방문 여부
var result = Array(repeating: Array(repeating: -1, count: m), count: n)     // 출력 결과

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

_ = (0..<n).map{
    area[$0] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

var start = [Int]()
for i in 0..<n {
    for j in 0..<m {
        if area[i][j] == 0 {            // 0인 경우, 미리 방문 처리 및 결과 0
            result[i][j] = 0
            visit[i][j] = true
        }
        if area[i][j] == 2 {            // 목표지점인 경우 미리 방문 처리 및 결과 0
            start = [i, j]
            result[i][j] = 0
            visit[i][j] = true
        }
    }
}

bfs(start)

func bfs(_ start: [Int]) {
    var queue = [(start, 0)]
    var index = 0
    
    while index < queue.count {
        let now = queue[index]
        
        for i in 0..<4 {
            let ny = now.0[0] + dy[i]
            let nx = now.0[1] + dx[i]
            
            if (0..<n).contains(ny) && (0..<m).contains(nx) && !visit[ny][nx] {
                visit[ny][nx] = true
                queue.append(([ny, nx], now.1 + 1))
                result[ny][nx] = now.1 + 1
            }
        }
        index += 1
    }
}

result.forEach{
    print($0.map{String($0)}.joined(separator: " "))
}

