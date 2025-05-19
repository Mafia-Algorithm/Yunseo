// 2624 - 동전 바꿔주기

import Foundation

let target = Int(readLine()!)!        // 만들고자 하는 금액
let n = Int(readLine()!)!             // 동전 종류 수

var coins = [(value: Int, count: Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    coins.append((value: input[0], count: input[1]))
}

var dp = Array(repeating: 0, count: target + 1)
dp[0] = 1

for (coin, count) in coins {
    // 뒤에서부터 순회해야 같은 동전을 여러 번 사용해도
    // 이번 루프에서 갱신된 dp 값이 중복 계산에 쓰이지 않음
    // 현재 sum을 만드는 방법이 하나라도 있다면
    for sum in stride(from: target, through: 0, by: -1) where dp[sum] > 0 {
        for k in 1...count {    // 이 동전을 1개부터 c개까지 사용
            let next = sum + coin * k
            if next > target { break }
            dp[next] += dp[sum]
        }
    }
}

print(dp[target])

