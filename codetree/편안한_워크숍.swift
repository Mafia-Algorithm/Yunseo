import Foundation

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let k = firstLine[1]

var grid = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
}

// Please write your code here.
// 인접한 경로 확인
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

// 이동 횟수별 가장 큰 높이차 저장
var dp = Array(repeating: Array(repeating: Array(repeating: Int.max, count: k+1), count: n), count: n)

// k이상이라고 했지만, k까지만 확인하면 됨. k이상의 모든 경로는 k만큼의 경로를 포함하고 있기 때문
for i in 0...k {            // 이동 횟수
    for r in 0..<n {        // row
        for c in 0..<n {    // col
            if i == 0 || i == 1 {
                dp[r][c][i] = 0
                continue
            }

            for j in 0..<4 {
                let y = dy[j]
                let x = dx[j]
                
                let ny = r + y
                let nx = c + x
                if !(0..<n).contains(ny) || !(0..<n).contains(nx) { continue }  // 범위 체크
                if grid[r][c] <= grid[ny][nx] { continue }      // 이동할 때마다 높이가 높아짐
                if dp[ny][nx][i-1] == Int.max { continue }      // 도달할 수 없는 경우

                // 높이차 최대값으로 업데이트
                dp[r][c][i] = min(dp[r][c][i], max(dp[ny][nx][i-1], grid[r][c] - grid[ny][nx]))
            }
        }
    }
}

var answer = Int.max
for r in 0..<n {
    for c in 0..<n {
        if answer > dp[r][c][k] { answer = dp[r][c][k] }
    }
}

answer == Int.max ? print(-1) : print(answer)
