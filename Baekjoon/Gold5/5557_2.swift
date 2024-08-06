// 5557 - 1학년(1초, 128MB)

import Foundation

let N = Int(readLine()!)!
let number = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: Array(repeating: 0, count: 21), count: N + 1)

// 첫번째 숫자로 만들 수 있는 경우의 수
dp[1][number[1]] += 1

for i in 2..<N {							// 두 번째 숫자부터 확인
	for j in 0...20 {						// 만들 수 있는 수는 0~20
		let num = number[i]
		if dp[i-1][j] != 0 {				// i-1번째 수까지 사용해서 만들 수 있는 숫자라면
			if 0...20 ~= j+num {			// +num, -num인 숫자 더함
				dp[i][j+num] += dp[i-1][j]	// 기존에 i번째 수로 j+num을 만들 수 있는 경우 + i-1로 j를 만들 수 있는 경우 누적
			}
			if 0...20 ~= j-num {
				dp[i][j-num] += dp[i-1][j]
			}
		}
	}
}

// N번째 수는 결과값이므로 N-1번 연산까지 진행했을 때 last 숫자를 만들 수 있는 경우의 수 출력
print(dp[N-1][number.last!])
