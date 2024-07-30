// 1654 - 랜선자르기(2초, 128MB)
/// 랜선의 최대 길이가 2^31 - 1이므로 mid를 구할 때 오버플로우 발생 가능 -> UInt64 사용

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let k = input[0], n = input[1]			// k: 가지고 있는 랜선 개수, n: 만들고자 하는 랜선 개수
var bar: [UInt64] = []

for _ in 0..<k {
	bar.append(UInt64(readLine()!)!)
}
bar.sort{ $0 < $1 }
var left: UInt64 = 1
var right: UInt64 = bar.last!
var result: UInt64 = 0

/// 만들 수 있는 동안 반복해서 탐색
while left <= right {
	let mid = (left + right) / 2
	var count: UInt64 = 0
	
	bar.forEach{
		count += $0 / mid
	}
	
	if count < n {					// 조건을 만족하지 않을 때 더 작게 잘라보기
		right = mid - 1
	} else if count >= n {			// 조건을 만족할 때 더 크게 잘라보기
		left = mid + 1
		result = mid
	}
}

print(result)

