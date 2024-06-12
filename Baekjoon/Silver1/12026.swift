
//  12026 - BOJ 거리
// 1<=N<=1000
// 2초, 512MB

import Foundation

let N = Int(readLine()!)!
let boj = readLine()!.map{String($0)}
var dp = Array(repeating: 0, count: N)

// 1인 경우 무조건 비용 0
if N == 1 {
    print(0)
    exit(0)
}

dp[0] = 0

for i in 0..<N {
    if i != 0 && dp[i] == 0 { continue }
    if boj[i] == "B" {
        for j in i+1..<N {          // 다음에 나올 문자 중 알맞은 것이 나온다면
            if boj[j] == "O" {
                // 방문한 적이 있는 경우 최솟값, 없는 경우 초기화
                dp[j] = dp[j] == 0 ? dp[i]+Int(pow(Double(j-i), 2)) : min(dp[j], dp[i]+Int(pow(Double(j-i), 2)))
            }
        }
    } else if boj[i] == "O" {
        for j in i+1..<N {
            if boj[j] == "J" {
                dp[j] = dp[j] == 0 ? dp[i]+Int(pow(Double(j-i), 2)) : min(dp[j], dp[i]+Int(pow(Double(j-i), 2)))
            }
        }
    } else if boj[i] == "J" {
        for j in i+1..<N {
            if boj[j] == "B" {
                dp[j] = dp[j] == 0 ? dp[i]+Int(pow(Double(j-i), 2)) : min(dp[j], dp[i]+Int(pow(Double(j-i), 2)))
            }
        }
    }
}

if dp.last! == 0 {
    print(-1)
} else {
    print(dp.last!)
}
