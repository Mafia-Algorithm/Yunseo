// 14503 - 로봇청소기(2초, 512MB)
/// 방 크기
/// 로봇의 위치와 방향(북, 동, 남, 서)



//현재 칸의 주변 칸 중 청소되지 않은 빈 칸이 있는 경우,
//반시계 방향으로 회전한다. -> 서, 남, 동, 북
//바라보는 방향을 기준으로 앞쪽 칸이 청소되지 않은 빈 칸인 경우 한 칸 전진한다.
//1번으로 돌아간다.

import Foundation

let size = readLine()!.split(separator: " ").map{Int(String($0))!} // N, M
let robot = readLine()!.split(separator: " ").map{Int(String($0))!} // 위치, 방향

var room: [[Int]] = []
let dy = [-1, 0, 1, 0]              // 북, 동, 남, 서
let dx = [0, 1, 0, -1]
var cleanRoom = 0

for _ in 0..<size[0] {
    room.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func dfs(_ y: Int, _ x: Int, _ direct: Int) {
    if room[y][x] == 0 {                               // 현재 칸이 청소되지 않은 경우
        cleanRoom += 1                                 // 청소한다!
        room[y][x] = 2
    }
    
    for i in 0..<4 {
        let dir = (direct + 3 - i) % 4
        let ny = y + dy[dir]       // 반시계 방향
        let nx = x + dx[dir]
        
        if (0..<size[0]).contains(ny) && (0..<size[1]).contains(nx) && room[ny][nx] == 0 {               // 이동할 수 있고
            dfs(ny, nx, dir)
            return
        }
    }
     
    // 네 가지 방향을 모두 보았을 때 청소할 거리가 없는 경우
    let backY = y + dy[(direct+2)%4]
    let backX = x + dx[(direct+2)%4]
        
    if (0..<size[0]).contains(backY) && (0..<size[1]).contains(backX) && room[backY][backX] != 1 {
            dfs(backY, backX, direct)             // 후진
    }
}

dfs(robot[0], robot[1], robot[2])
print(cleanRoom)

