// 5557 - 1학년

import Foundation

let N = Int(readLine()!)!
let numbers = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}     // 인덱스 맞춰주기 위해 [0] 삽입

var dp = Array(repeating: Array(repeating: 0, count: 21), count: N+1)

dp[1][numbers[1]] = 1

for i in 2..<N {
    for j in 0...20 {
        if dp[i-1][j] != 0 {                    // 이전 수식에서 만들었던 수라면
            if 20 >= j+numbers[i] {             // 상한선 확인
                // j+numbers[i]가 될 수 있는 경우의 수는 이전 수의 경우의 수를 더해야함
                dp[i][j+numbers[i]] += dp[i-1][j]
            }
            if 0 <= j-numbers[i] {              // 하한선 확인
                // j-numbers[i]가 될 수 있는 경우의 수는 이전 수의 경우의 수를 더해야함
                dp[i][j-numbers[i]] += dp[i-1][j]
            }
        }
    }
}

// N번째 수와 동일해야하므로 N-1값이 정답
print(dp[N-1][numbers.last!])
