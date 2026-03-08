// 1194 - 달이 차오른다, 가자.

// 키를 어떻게 관리하는게 중요한 문제
// 키를 획득하고 왔던 길을 다시 돌아가야 함 -> 단순 y, x 위치만으로는 무한 재방문
// y, x좌표와 키의 상태까지 확인해서 방문 여부를 탐색해야함
// 키의 상태는 비트마스크로 관리

import Foundation

let size = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = size[0], m = size[1]

var maze: [[Character]] = []
var start: (Int, Int) = (0, 0)

for i in 0..<n {
    let input: [Character] = Array(readLine()!)
    maze.append(input)
    
    for j in 0..<input.count {
        if input[j] == "0" {
            start = (i, j)
        }
    }
}

let dy = [0, 0, 1, -1]
let dx = [1, -1, 0, 0]

func bfs() -> Int {
    // y, x, 이동 횟수, 키 상태
    var queue: [(Int, Int, Int, Int)] = [(start.0, start.1, 0, 0)]
    var index = 0
    
    /// 키 종류가 6개이기 때문에 2^6 = 64개
    /// 위치 뿐만아니라 키 소유 상태까지 관리
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 64), count: m), count: n)
//    visited[queue[0].0][queue[0].1][queue[0].3] = true
    
    while index < queue.count {
        let (y, x, count, keys) = queue[index]
        
        if maze[y][x] == "1" {
            return count
        }
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            /// 범위를 벗어나는 경우
            if !(0..<n).contains(ny) || !(0..<m).contains(nx) || maze[ny][nx] == "#" {
                continue
            }
            
            let cell = maze[ny][nx]
            var newKeys = keys
            
            // 키 획득
            if cell >= "a" && cell <= "f" {
                let keyIndex = Int(cell.asciiValue! - Character("a").asciiValue!)
                newKeys |= (1 << keyIndex)       // "A" - "A" = 0이기 때문에 인덱스 보정
            }
            
            // 키가 있어야 지나가는 경우
            if cell >= "A" && cell <= "F" {     // 대문자인 경우
                let keyIndex = Int(cell.asciiValue! - Character("A").asciiValue!)
                /// 키가 없다면 지나가지 못함
                if (newKeys & (1 << keyIndex)) == 0 {          // 마찬가지로 인덱스 보정 후 키에 추가
                    continue
                }
            }
            
            // 해당 위치를 해당 키 값 상태로 방문한 적 있는 경우 스킵
            if visited[ny][nx][newKeys] {
                continue
            }
            
            visited[ny][nx][newKeys] = true
            queue.append((ny, nx, count + 1, newKeys))
        }
        
        index += 1
    }
    
    return -1
}

print(bfs())

