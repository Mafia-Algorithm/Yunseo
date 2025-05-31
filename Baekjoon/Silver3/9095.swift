// 9095 - 1, 2, 3 더하기

import Foundation

var dp = Array(repeating: 0, count: 12)
dp[0] = 1
dp[1] = 1
dp[2] = 2

for i in 3..<dp.count {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let n = Int(readLine()!)!
    
    print(dp[n])
}

