// 3190 - 뱀(1초, 128MB)

import Foundation

let N = Int(readLine()!)!
let apple = Int(readLine()!)!               // 사과 개수
var apples = [[Int]]()                 // 사과 위치 저장하는 2차원 배열
var moves = [Int: String]()                // 움직이는 순간을 저장하는 딕셔너리
var snake: [[Int]] = [[1, 1]]                  // 뱀의 처음 위치

// 북, 동, 서, 남 순서
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]

for _ in 0..<apple {
    apples.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 시간 별 움직인 횟수 저장
let move = Int(readLine()!)!
for _ in 0..<move {
    let temp = readLine()!.split(separator: " ").map{String($0)}
    moves[Int(temp[0])!] = temp[1]
}

var time = 0            // 게임 시작 후 경과 시간
var direction = 1       // 오른쪽 방향으로 출발
func dfs(_ y: Int, _ x: Int) {      // 뱀의 다음 위치 전달
    snake.append([y, x])            // 뱀의 머리 이동
    time += 1                       // 시간 경과
    
    // 뱀이 벽에 부딪히거나, 자기 자신과 부딪힌다면 종료
    if !(1...N).contains(y) || !(1...N).contains(x) || conflict(y, x) {
        return
    }
    
    // 사과 확인
    if checkApple(y, x) {                                           // 뱀 머리 위치에 사과가 있다면
        apples.remove(at: apples.firstIndex(of: [y, x])!)           // apples 배열에서 해당 값 제거
    } else {
        snake.remove(at: 0)                                         // 사과가 없다면 꼬리 제거
    }
    
    
    // 이동할 시간인지 확인
    if let direct = checkMove(time) {
        if direct == "D" {              // 오른쪽
            direction = (direction + 1) % 4
        } else if direct == "L" {       // 왼쪽
            direction = (direction + 3) % 4
        }
    }
    
    // 다음 이동 때 뱀이 바라볼 위치
    let ny = y + dy[direction]
    let nx = x + dx[direction]
    
    dfs(ny, nx)
    
    return
}

// 해당 위치에 사과가 있는지 판단하는 함수
func checkApple(_ y: Int, _ x: Int) -> Bool {
    if apples.contains([y, x]) {
        return true
    }
    return false
}

// 이동 시간인지 확인
func checkMove(_ time: Int) -> String? {
    if let _ = moves[time] {
        return moves[time]
    }
    return nil
}

// 충돌 확인
func conflict(_ y: Int, _ x: Int) -> Bool {
    return snake.filter({$0 == [y, x]}).count > 1
}

dfs(1, 2)
print(time)
