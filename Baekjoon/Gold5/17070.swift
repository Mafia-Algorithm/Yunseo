// 17070 - 파이프 옮기기 1(1초, 512MB)

/// bfs인가? -> 답지 봄, dp였다.. 어케 dp인지 생각해?!?!

import Foundation

let size = Int(readLine()!)!
var home: [[Int]] = []
var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: size), count: size)

for _ in 0..<size {
    home.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 1..<size {
    if home[0][i] == 1 {                // 벽이 한 번 나타나면 그 뒤로 이동 불가
        break
    }
    dp[0][i][0] = 1
}

for i in 1..<size {
    for j in 2..<size {
        if home[i][j] != 1 {
            dp[i][j][0] = dp[i][j-1][0] + dp[i][j-1][2]
            dp[i][j][1] = dp[i-1][j][1] + dp[i-1][j][2]
            if home[i-1][j] != 1 && home[i][j-1] != 1 {         // 대각선의 경우 왼쪽, 위쪽을 확인해야 함
                dp[i][j][2] = dp[i-1][j-1].reduce(0, +)
            }
        }
        
        
    }
}

print(dp[size-1][size-1].reduce(0, +))

