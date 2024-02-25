// 1309 - 동물원

import Foundation

let N = Int(readLine()!)!       // 우리의 크기
var dp = Array(repeating: Array(repeating: 0, count: 3), count: N + 1)

/// i = 사자의 수
/// j = 0 -> [0, 0], j = 1 -> [1, 0], j = 2 -> [0, 1]
dp[1][0] = 1
dp[1][1] = 1
dp[1][2] = 1

if N >= 2 {
    for i in 2...N {
        dp[i][0] = dp[i-1].reduce(0, +) % 9901
        dp[i][1] = dp[i-1][0] + dp[i-1][2] % 9901
        dp[i][2] = dp[i-1][0] + dp[i-1][1] % 9901
    }
}

print(dp[N].reduce(0, +) % 9901)

