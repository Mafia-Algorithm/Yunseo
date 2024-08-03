// 15486 - 퇴사2(2초, 512MB)

import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+2)				// dp[i] = i일에 얻을 수 있는 최대 이익
var timeLine: [[Int]] = [[]]

for _ in 0..<N {
	timeLine.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 1...N {
	// i일 상담을 하기 전, i일까지 얻을 수 있는 최대이익 설정
	if dp[i] < dp[i-1] {
		dp[i] = dp[i-1]
	}
	
	let todayTime = timeLine[i][0]
	let cost = timeLine[i][1]
	// 1일에 3일 걸리는 상담을 수행하면 4일에 수익을 얻을 수 있음 -> 4일까지는 아무일도 할 수 없으므로 index[5]에 이익 업데이트
	// N일에서 1일 걸리는 상담까지 진행하려면 N+1까지 가능
	if i+todayTime <= N+1 {
		dp[i+todayTime] = max(dp[i+todayTime], dp[i] + cost)
	}
}

// 6일에서 1일치 상담을 하고, 7일에서 2일치 상담을 하면 8일은 0이되어 최대 이익은 dp[7]이어야 함 -> max를 출력하여 해결
print(dp.max()!)
