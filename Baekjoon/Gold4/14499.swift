// 14499 - 주사위 굴리기

// 1: 동, 2: 서, 3: 북, 4: 남

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]                      // 세로, 가로
var y = input[2], x = input[3]                     // 주사위의 현재 위치
var dices = Array(repeating: 0, count: 7)           // 주사위의 각 면 숫자 저장

let dy = [0, 0, 0, -1, 1]                           // 동, 서, 북, 남 순
let dx = [0, 1, -1, 0, 0]

var maps: [[Int]] = []

// 지도 정보 입력
for _ in 0..<N {
    maps.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 명령 입력
let command = readLine()!.split(separator: " ").map{Int(String($0))!}

for c in command {
    // 굴렸을 때 이동 위치
    let ny = y + dy[c]
    let nx = x + dx[c]
    
    // 범위 밖을 벗어나지 않는지 확인
    if (0..<N).contains(ny) && (0..<M).contains(nx) {
        // 주사위 굴리기
        rollDice(c: c)
        
        // 바닥면 확인
        if maps[ny][nx] == 0 {                          // 현재 위치가 0이라면
            maps[ny][nx] = dices[6]                // 현재 위치 값 = 주사위 바닥 값
        } else {                                        // 바닥면이 0이 아니라면
            dices[6] = maps[ny][nx]                 // 주사위 바닥 값 = 현재 위치 값
            maps[ny][nx] = 0
        }
        
        // 위치 업데이트
        y = ny
        x = nx
        print(dices[1])
    }
}

// 주사위 굴리기
func rollDice(c: Int) {
    let temp = dices[1]
    switch c {
    case 1:                 // 동쪽으로 굴리기
        dices[1] = dices[4]
        dices[4] = dices[6]
        dices[6] = dices[3]
        dices[3] = temp
    case 2:                 // 서쪽으로 굴리기
        dices[1] = dices[3]
        dices[3] = dices[6]
        dices[6] = dices[4]
        dices[4] = temp
    case 3:                 // 북쪽으로 굴리기
        dices[1] = dices[5]
        dices[5] = dices[6]
        dices[6] = dices[2]
        dices[2] = temp
    default:                // 남쪽으로 굴리기
        dices[1] = dices[2]
        dices[2] = dices[6]
        dices[6] = dices[5]
        dices[5] = temp
    }
}

