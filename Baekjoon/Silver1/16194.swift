// 16194 - 카드 구매하기2

import Foundation

let N = Int(readLine()!)!
var dp = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}

if N == 1 {
    print(dp[1])
    exit(0)
}

for i in 2...N {
    for j in 1...i {
        if dp[i] > dp[i-j] + dp[j] {
            dp[i] = dp[i-j] + dp[j]
        }
    }
}

print(dp[N])
