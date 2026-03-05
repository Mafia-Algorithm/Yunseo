// 2638 - 치즈

// 전에 겉면부터 썩는 음식이랑 같은 문제
// 단 이번에는 두 면이 닿아야 녹음

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]

var cheese: [[Int]] = []
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map{Int(String($0))!}
    cheese.append(info)
}

let dy = [0, 0, 1, -1]
let dx = [1, -1, 0, 0]

// 녹일 위치
var melting: [[Int]: Int] = [:]          // y좌표, x좌표
var visit = Array(repeating: Array(repeating: false, count: m), count: n)

// 녹일 치즈 탐색
func bfs() {
    var queue: [(Int, Int)] = [(0, 0)]
    visit[0][0] = true
    var index = 0
    
    while index < queue.count {
        let now = queue[index]
        let y = now.0, x = now.1

        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if (0..<n).contains(ny) && (0..<m).contains(nx) && !visit[ny][nx] {
                if cheese[ny][nx] == 1 {            // 치즈인 경우 후보에 올림
                    melting[[ny, nx], default: 0] += 1
                } else {                            // 치즈가 아닌 경우 탐색
                    queue.append((ny, nx))
                    visit[ny][nx] = true
                }
            }
        }
        
        index += 1
    }
}


func melt() {
    let deleteList = melting.filter{ $0.value >= 2 }.keys
    
    deleteList.forEach { place in
        let y = place[0]
        let x = place[1]
        
        cheese[y][x] = 0
    }
}

var answer = 0

while true {
    melting = [:]          // y좌표, x좌표
    visit = Array(repeating: Array(repeating: false, count: m), count: n)
    
    bfs()
    if melting.count == 0 {
        print(answer)
        break
    }
    melt()
    answer += 1
}


// 성능 개선
// 1. Dictionary 대신 2차원 배열 사용
//현재 melting을 [[Int]: Int] 타입의 Dictionary로 사용하고 있음
//문제: Swift에서 배열([Int])을 Key로 사용하면 매번 해시 계산 비용이 발생하며, 딕셔너리 접근 자체가 2차원 배열 접근보다 훨씬 느림.
//
//해결: melting 역시 [[Int]] 형태의 2차원 배열(Int)로 선언하여 접촉 횟수 기록
