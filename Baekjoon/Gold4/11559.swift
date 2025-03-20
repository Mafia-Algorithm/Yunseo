// 11559 - PuyoPuyo(1초, 256MB)

import Foundation

var puyo: [[String]] = []

// 뿌요 상태 입력
for _ in 0..<12 {
    puyo.append(readLine()!.map{String($0)})
}
                
var visit = Array(repeating: Array(repeating: false, count: 6), count: 12)
let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]
var answer = 0

func bfs(_ y: Int, _ x: Int, _ color: String) -> Bool {
    var index = 0
    var queue: [[Int]] = [[y, x]]
    var puyoCount = 0               // 뿌요 개수
    var tempPuyo = puyo             // 해당 bfs에서의 뿌요 상태
    
    while index < queue.count {
        let now = queue[index]
        
        for i in 0..<4 {
            let ny = now[0] + dy[i]
            let nx = now[1] + dx[i]
            
            // 범위 내, 방문한 적 없음, 컬러 같은 경우
            if (0..<12).contains(ny) && (0..<6).contains(nx) && !visit[ny][nx] && puyo[ny][nx] == color {
                queue.append([ny, nx])
                visit[ny][nx] = true        // 방문처리
                tempPuyo[ny][nx] = "."          // 문자열 변경
                puyoCount += 1                  // 뿌요 개수 + 1
            }
        }
        index += 1
    }
    
    if puyoCount >= 4 {                         // 뿌요 개수가 4 이상인 경우
        puyo = tempPuyo                         // 실제 뿌요 배열 업데이트
        return true
    }
    return false
}

var repeating = true

while repeating {
    var chain = 0                                   // 터짐 횟수
    
    // 순회하며 뿌요 없애기
    for i in stride(from: 11, through: 0, by: -1) {
        for j in 0..<6 {
            if !visit[i][j] && puyo[i][j] != "."{
                if bfs(i, j, puyo[i][j]) {              // 연쇄 작업이 있었다면
                    chain += 1                          // 정답 + 1
                }
            }
        }
    }
    
    // 빈 뿌요 칸 채우기
    var count = 11
    for j in 0..<6 {
        count = 12
        for i in stride(from: 11, through: 0, by: -1) {
            if puyo[i][j] != "." {                  // 뿌요가 있는 경우
                count -= 1
                if i == 11 { continue }             // 바닥인 경우 continue
                else if puyo[i+1][j] == "." {       // 바닥이 아니고 아래 칸이 비어있는 경우
                    let temp = puyo[i][j]           // 업데이트
                    puyo[count][j] = temp
                    puyo[i][j] = "."
                }
            }
        }
    }
    
    // 방문 배열 초기화
    visit = Array(repeating: Array(repeating: false, count: 6), count: 12)
    
    // 반복 여부 repeating 결정
    repeating = chain > 0 ? true : false                // 터짐이 있었다면 true
    answer = repeating ? answer + 1 : answer            // 연쇄 횟수 추가
}
print(answer)
