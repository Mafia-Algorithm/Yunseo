le index < fireQueue.count {
    let (y, x) = fireQueue[index]
    index += 1
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny >= r || nx < 0 || nx >= c { continue }
        if miro[ny][nx] == "#" || fireDist[ny][nx] >= 0 { continue }
        
        fireDist[ny][nx] = fireDist[y][x] + 1
        fireQueue.append((ny, nx))
    }
}

// 2. 지훈이의 BFS (탈출 시도)
index = 0
while index < jihoonQueue.count {
    let (y, x) = jihoonQueue[index]
    index += 1
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        // 범위를 벗어나면 탈출 성공!
        if ny < 0 || ny >= r || nx < 0 || nx >= c {
            priimport Foundation

// 4179 - 불!

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = input[0], c = input[1]

var miro = [[Character]]()
var fireDist = Array(repeating: Array(repeating: -1, count: c), count: r) // 불 전파 시간
var jihoonDist = Array(repeating: Array(repeating: -1, count: c), count: r) // 지훈 이동 시간

var fireQueue = [(Int, Int)]()
var jihoonQueue = [(Int, Int)]()

for i in 0..<r {
    let row = Array(readLine()!)
    miro.append(row)
    for j in 0..<c {
        if row[j] == "F" {
            fireQueue.append((i, j))
            fireDist[i][j] = 0
        } else if row[j] == "J" {
            jihoonQueue.append((i, j))
            jihoonDist[i][j] = 0
        }
    }
}

let dy = [0, 0, 1, -1]
let dxnt(jihoonDist[y][x] + 1)
            exit(0)
        }
        
        if miro[ny][nx] == "#" || jihoonDist[ny][nx] >= 0 { continue }
        
        // 불이 아직 도달하지 않았거나, 지훈이가 불보다 먼저 도착할 수 있는 경우만 이동
        if fireDist[ny][nx] != -1 && fireDist[ny][nx] <= jihoonDist[y][x] + 1 { continue }
        
        jihoonDist[ny][nx] = jihoonDist[y][x] + 1
        jihoonQueue.append((ny, nx))
    }
}

print("IMPOSSIBLE")

