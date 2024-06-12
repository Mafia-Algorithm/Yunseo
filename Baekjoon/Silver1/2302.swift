// 2302 - 극장 좌석

import Foundation

let seat = Int(readLine()!)!
let vip = Int(readLine()!)!
var isSeated = Array(repeating: false, count: seat + 1)
var dp = Array(repeating: 0, count: seat + 1)

for _ in 0..<vip {
    isSeated[Int(readLine()!)!] = true
}

dp[0] = 1
dp[1] = 1
isSeated[0] = true

if seat <= 1 {
    print(1)
} else {
    for i in 2...seat {
        dp[i] = dp[i-1] + dp[i-2]
    }

    var answer = 1
    isSeated.split(separator: true).forEach{answer *= dp[$0.count]}
    print(answer)
}
