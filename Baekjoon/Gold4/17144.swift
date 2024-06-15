// 17144 - 미세먼지 안녕!(1초, 512MB)
/// r: 행, c: 열, t: 시간

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}         // r, c, t
let R = input[0], C = input[1], T = input[2]
var dryMap: [[Int]] = []                                                    // 정보 입력
var robot: [(Int, Int)] = []                                                // 공기청정기 위치 입력
var queue: [(Int, Int)] = []                                                // 먼지 시작점 정보
var dry: [Int] = []

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

// 먼지 상태 입력
for _ in 0..<R {
    dryMap.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 공기 청정기 위치와 먼지 위치 저장
for i in 0..<R {
    for j in 0..<C {
        if dryMap[i][j] == -1 {                                             // 공기청정기 위치 저장
            robot.append((i, j))
        } else if dryMap[i][j] > 0 {                                        // 먼지 위치 저장
            queue.append((i, j))
            dry.append(dryMap[i][j])
        }
    }
}

var time = 0
while time < T {
    time += 1                       // 시간 증가
    queue = []
    dry = []
    findDry()                       // 미세먼지 찾기
    bfs()                           // 미세먼지 확산
    
    rotateAntiClock(robot[0])       // 반시계방향 회전
    rotateClock(robot[1])           // 시계방향 회전
}

func findDry() {
    for i in 0..<R {
        for j in 0..<C {
            if dryMap[i][j] > 0 {
                queue.append((i, j))
                dry.append(dryMap[i][j])
            }
        }
    }
}


// 미세먼지 확산

func bfs() {
    var index = 0
    while index < queue.count {
        let now = queue[index]
        
        for i in 0..<4 {
            let ny = now.0 + dy[i]
            let nx = now.1 + dx[i]
            
            // 범위 내에 있고, 공기청정기가 없다면 확산
            if (0..<R).contains(ny) && (0..<C).contains(nx) && dryMap[ny][nx] != -1 {
                let dry = dry[index] / 5              // 확산되는 먼지의 양
                dryMap[now.0][now.1] -= dry                     // 현재 위치에서 확산 먼지만큼 제거
                dryMap[ny][nx] += dry                           // 확산 위치에 확산 먼지만큼 추가
            }
        }
        index += 1
    }
}

// 반시계 방향 회전
func rotateAntiClock(_ start: (Int, Int)) {
    let r = start.0         // 행
    
    // 서쪽
    for row in stride(from: r-1, through: 1, by: -1) {
        dryMap[row][0] = dryMap[row-1][0]
    }
    
    // 북쪽
    for col in 0..<C-1 {
        dryMap[0][col] = dryMap[0][col+1]
    }
    
    // 동쪽
    for row in 0..<r {
        dryMap[row][C-1] = dryMap[row+1][C-1]
    }
    
    // 남쪽
    for col in stride(from: C-1, through: 2, by: -1) {
        dryMap[r][col] = dryMap[r][col-1]
    }
    
    dryMap[r][1] = 0
}

// 시계 방향 회전
func rotateClock(_ start: (Int, Int)) {
    let r = start.0
    
    // 서
    for row in r+1..<R-1 {
        dryMap[row][0] = dryMap[row+1][0]
    }
    
    // 남
    for col in 0..<C-1 {
        dryMap[R-1][col] = dryMap[R-1][col+1]
    }
    
    // 동
    for row in stride(from: R-1, through: r+1, by: -1) {
        dryMap[row][C-1] = dryMap[row-1][C-1]
    }
    
    // 북
    for col in stride(from: C-1, through: 2, by: -1) {
        dryMap[r][col] = dryMap[r][col-1]
    }
    
    dryMap[r][1] = 0
}

var answer = 0
dryMap.forEach {
    answer += $0.reduce(0, +)
}

// 공기청정기의 -2를 더해서 출력
print(answer + 2)

