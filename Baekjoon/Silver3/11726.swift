// 11726 - 2xn 타일링

import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)

if N == 1 {
    print(1)
} else if N == 2 {
    print(2)
} else {
    dp[1] = 1
    dp[2] = 2
    for i in 3...N {
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }
    print(dp[N])
}


