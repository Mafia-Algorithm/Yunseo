// 1743 - 음식물 피하기

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], K = input[2]

var food = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)        // 음식 지도
var visit = Array(repeating: Array(repeating: false, count: M+1), count: N+1)   // 방문 처리
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var count = [Int]()

// 음식 위치 입력 받기
for _ in 1...K {
    let loc = readLine()!.split(separator: " ").map{Int(String($0))!}
    food[loc[0]][loc[1]] = 1
}

// dfs로 가장 큰 음식물 찾기
var foodCount = 0
for i in 1...N {
    for j in 1...M {
        if food[i][j] == 1 {
            foodCount = 1
            visit[i][j] = true
            dfs(i, j)
            count.append(foodCount)
        }
    }
}

func dfs(_ y: Int, _ x: Int) {
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if (1...N).contains(ny) && (1...M).contains(nx) && !visit[ny][nx] && food[ny][nx] == 1 {
            foodCount += 1
            visit[ny][nx] = true
            dfs(ny, nx)
        }
    }
}

print(count.max()!)


