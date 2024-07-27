// 2023 - 신기한 소수(2초, 4MB)
// 에라토스테네스의 체 -> 소수 구하는 방법 -> 10^4 * 10^8 -> 시간초과!!!

import Foundation

print(MemoryLayout.size(ofValue: true))

let length = Int(readLine()!)!
let firstList = [2, 3, 5, 7]					// 한자리수 소수는 네 개 중 하나

/// 소수 판정 함수
func isPrime(_ number: Int) -> Bool {
	for i in 2...Int(sqrt(Double(number))) {
		if number % i == 0 { return false }		// 소수가 아닌 경우 즉시 종료
	}
	return true
}

func dfs(_ number: Int, _ depth: Int) {
	if depth == length {						// 주어진 길이와 같다면 출력
		print(number)
	}
	
	for i in 0...9 {							// 다음으로 올 수 있는 수 0 ~ 9
		if isPrime(number * 10 + i) {			// 다음 수를 붙여도 소수인 경우
			dfs(number * 10 + i, depth + 1)		// dfs 실행
		}
	}
}

// 2, 3, 5, 7로 시작하는 dfs실행
for f in firstList {
	dfs(f, 1)
}
