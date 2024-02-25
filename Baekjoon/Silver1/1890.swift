// 1890 - 점프

import Foundation

let N = Int(readLine()!)!
var game = [[Int]]()
var visit = Array(repeating: Array(repeating: false, count: N), count: N)
var dp = Array(repeating: Array(repeating: 0, count: N), count: N)

for _ in 1...N {
    game.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

visit[0][0] = true
dp[0][0] = 1

// 오른쪽, 아래쪽으로만 점프하기 때문에 브루트포스로 해도 100 * 100
for i in 0..<N {
    for j in 0..<N {
        if i == N-1 && j == N-1 {
            print(dp[i][j])
            break
        }
        if visit[i][j] {               // 방문한 적이 있다면
            let nx = j + game[i][j]     // 해당 점프
            let ny = i + game[i][j]
            
            // 오른쪽
            if nx < N {
                dp[i][nx] += dp[i][j]       // 현재 위치까지 오는 경우의 수를 더함
                visit[i][nx] = true
            }
            
            // 아래쪽
            if ny < N {
                dp[ny][j] += dp[i][j]
                visit[ny][j] = true
            }
        }
    }
}

