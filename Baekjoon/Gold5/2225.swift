// 2225 - 합분해
/// 1. N과 K를 입력 받음. 0~N까지 정수 K개를 더해서 그 합이 N이 되는 경우 구하기

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]

var dp = Array(repeating: Array(repeating: 1, count: N+1), count: K+1)

if K > 1 {                          // K <=1 인 경우 2...K에서 인덱스 오류 발생
    for i in 2...K {
        for j in 1...N {
            dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % 1000000000
        }
    }
}

print(dp[K][N])

