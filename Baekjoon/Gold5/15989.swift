import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: 0,count : 10001)
dp[1] = 1
dp[2] = 2
dp[3] = 3

for i in 4..<10001 {
    dp[i] = 1 + (i / 2) + dp[i-3]
}

for _ in 0..<T {
    let input = Int(readLine()!)!
    print(dp[input])
}
