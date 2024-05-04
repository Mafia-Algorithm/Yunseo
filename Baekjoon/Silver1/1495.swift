// 1495 - 기타리스트

// N, S, M (곡의 개수, 시작 볼륨, 볼륨 최댓값)
// 실행할 수 있는 볼륨 여러개일 수 있음. 음악 개수가 아니라 볼륨 범위로 dp를 해야하나?

// 헉,, -1, +1로 true/false를 채우는게 아님. [곡 순서][볼륨 크기]를 의미

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], S = input[1], M = input[2]
let music = readLine()!.split(separator: " ").map{Int(String($0))!}

var dp = Array(repeating: Array(repeating: false, count: M + 1), count: N+1)

dp[0][S] = true

for i in 1...N {
    for j in 0...M {
        if dp[i-1][j] {
            if j - music[i-1] >= 0 {
                dp[i][j - music[i-1]] = true
            }
            if j + music[i-1] <= M {
                dp[i][j + music[i-1]] = true
            }
        }
    }
}

for i in stride(from: M, through: 0, by: -1) {
    if dp[N][i] {
        print(i)
        exit(0)
    }
}
print(-1)

