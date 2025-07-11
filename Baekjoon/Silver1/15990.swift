// 15990 - 1, 2, 3 더하기 5
// 1초, 512MB

import Foundation

let T = Int(readLine()!)!
var testCase: [Int] = []
for _ in 0..<T {
    testCase.append(Int(readLine()!)!)
}

var max = testCase.max()!
max = max <= 3 ? 4 : max
var dp = Array(repeating: Array(repeating: 0, count: 4), count: max+1)

dp[1][1] = 1
dp[2][2] = 1
dp[3][1] = 1
dp[3][2] = 1
dp[3][3] = 1

for i in 4...max {
    dp[i][1] = (dp[i-1][2] + dp[i-1][3]) % 1000000009
    dp[i][2] = (dp[i-2][1] + dp[i-2][3]) % 1000000009
    dp[i][3] = (dp[i-3][1] + dp[i-3][2]) % 1000000009
}

var answer = ""
for t in testCase {
    answer.append("\(dp[t].reduce(0, +)%1000000009)\n")
}

print(answer)
