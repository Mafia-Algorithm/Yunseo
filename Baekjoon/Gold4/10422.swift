// 10422 - 괄호

// dp[6]
// [----] -> dp[4]의 개수
// [--][] -> dp[2]의 개수 * dp[2]
// [][--] -> dp[2]의 개수 * dp[2]

// dp[8]
// [------] -> dp[6]의 개수
// [----][] -> dp[4]의 개수 * dp[2]의 개수
// [--][--] -> dp[2]의 개수 * dp[4]의 개수
// [][----] -> dp[2]의 개수 * dp[6]의 개수

import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: 0, count: 5001)

dp[0] = 1       // 실제 개수는 0개이지만 곱셈을 위해 1로 설정
dp[2] = 1
dp[4] = 2

for i in stride(from: 6, through: 5001, by: 2) {        // i = 괄호 전체 개수
    for j in stride(from: 2, through: i, by: 2) {            // j = 첫번째 괄호의 짝꿍
        dp[i] += (dp[j-2] * dp[i-j]) % 1000000007
    }
    dp[i] = dp[i] % 1000000007
}

for _ in 0..<T {
    let count = Int(readLine()!)!
    print(dp[count])
}



