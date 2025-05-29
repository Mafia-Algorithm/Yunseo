// 11051 - 이항 계수
// 이항 계수 = nCk와 같음
// 파스칼 삼각형 이용

//    1
//   1 1
//  1 2 1
// 1 3 3 1
//1 4 6 4 1
//dp[3][1] = dp[2][0] + dp[2][1]


import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = [[Int]]()

for i in 0...input[0] {
    dp.append(Array(repeating: 0, count: i+1))
    dp[i][0] = 1
    dp[i][i] = 1
}

if input[0] >= 2 {                   // 런타임 에러 방지
    for n in 2...input[0] {          // dp[2]까지는 모두 1로 세팅되어 계산할 필요 없음
        for k in 1..<dp[n-1].count { // dp[n][0]과 dp[n][n-1]은 항상 1
            dp[n][k] = (dp[n-1][k-1] + dp[n-1][k]) % 10007
        }
    }
}
print(dp[input[0]][input[1]])

