// 12852 - 1로 만들기2

// 1. X가 3으로 나누어 떨어지면, 3으로 나눈다.
// 2. X가 2로 나누어 떨어지면, 2로 나눈다.
// 3. 1을 뺀다.

import Foundation

var target = Int(readLine()!)!
var dp = Array(repeating: (Int.max, ""), count: target + 1)

dp[1] = (0, "1")            // 연산 횟수, 해당 숫자를 만든 기록

for i in 1...target {
    if i * 2 <= target {        // 범위 체크
        if dp[i*2].0 > dp[i].0 + 1 {            // *2 숫자의 현재 연산 횟수>현재 숫자에 한 번 더 *2 연산을 한 횟수
            dp[i*2] = (dp[i].0 + 1, "\(i * 2) " + dp[i].1)      // 업데이트
        }
    }
    
    if i * 3 <= target {
        if dp[i*3].0 > dp[i].0 + 1 {
            dp[i*3] = (dp[i].0 + 1, "\(i * 3) " + dp[i].1)
        }
    }
    
    if i + 1 <= target {
        if dp[i+1].0 > dp[i].0 + 1 {
            dp[i+1] = (dp[i].0 + 1, "\(i + 1) " + dp[i].1)
        }
    }
}

print(dp[target].0)
print(dp[target].1)
