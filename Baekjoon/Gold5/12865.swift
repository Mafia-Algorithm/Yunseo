import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]
var bag: [[Int]] = [[0, 0]]
var dp = Array(repeating: Array(repeating: 0, count: K+1), count: N+1)

for _ in 0..<N {
    bag.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 1...N {                // 물건 개수
    for j in 1...K {            // 무게
        if bag[i][0] <= j {       // 현재 물건의 무게가 배낭의 무게보다 작거나 같은 경우
            dp[i][j] = max(dp[i-1][j], bag[i][1] + dp[i-1][j-bag[i][0]])
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[N][K])
