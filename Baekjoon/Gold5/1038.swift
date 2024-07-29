// 1038 - 감소하는 수(1초, 512MB)

import Foundation

/// 숫자로 저장하면 [Int]로 추가해서 다시 Int로 변경해야하기 때문에 문자로 저장
let n = Int(readLine()!)!
var answer: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

/// numbers: 현재 숫자 상태, next: 다음에 올 수 있는 숫자 범위, depth: 숫자 길이
func combination(_ numbers: [String], _ next: Int, _ depth: Int) {
	/// 현재 숫자가 정해둔 길이와 같다면 append
	if numbers.count == depth {
		answer.append(numbers.joined())
	}
	
	/// 다음에 올 수 있는 숫자는 i보다 작은 수
	for i in 0..<next {
		combination(numbers + ["\(i)"], i, depth)
	}
}

for i in 2...10 {						/// 자릿수 의미
	for j in 0...9 {					/// 시작하는 숫자
		combination(["\(j)"], j, i)
	}
}

/// n이 answer 범위에 없다면 -1 출력
if n >= answer.count {
	print(-1)
} else {
	print(answer[n])
}

