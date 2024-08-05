// 9084 - 동전(1초, 128MB)

import Foundation

let TC = Int(readLine()!)!

for _ in 0..<TC {
	let N = Int(readLine()!)!														// 동전의 가짓수
	let coins = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}		// 동전 종류
	let target = Int(readLine()!)!													// 만들려는 수
	
	var dp = Array(repeating: Array(repeating: 0, count: target + 1), count: N + 1)
	
	// 어느 동전이든 0을 만드는 경우의 수는 1개 존재
	for i in 0...N {
		dp[i][0] = 1
	}
	
	for i in 1...N {																// 동전 가짓수
		for j in 0...target {
			dp[i][j] = dp[i-1][j]					// i번째 동전으로 j를 만드는 방법 = i-1번째 동전으로 j를 만드는 방법
			// j원 - 현재 동전 >= 0인 경우
			if j - coins[i] >= 0 {
				// i번째 동전으로 j원을 만드는 경우: i-1번째 동전으로 j원 만들기 + i번째 동전으로 j-i원 을 만드는 경우
				dp[i][j] += dp[i][j-coins[i]]
			}
		}
	}
	print(dp.last!.last!)
}

