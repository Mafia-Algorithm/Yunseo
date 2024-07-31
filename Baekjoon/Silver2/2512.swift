// 2512 - 예산(1초, 128MB)

import Foundation

let N = Int(readLine()!)!
let budget = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = Int(readLine()!)!
let budgetSum = budget.reduce(0, +)

/// 모든 예산이 정해진 예산보다 적으면 최댓값 출력
if budgetSum <= M {
	print(budget.max()!)
	exit(0)
}

var left = 1
var right = M
var answer = 0

while left <= right {
	let mid = (left + right) / 2
	var money = 0
	
	/// 예산 배정
	budget.forEach {
		if $0 >= mid {				/// 상한선보다 크면 상한선 제공
			money += mid
		} else {					/// 상한선보다 작으면 전부 제공
			money += $0
		}
	}
	
	if money > M {				// 주어진 예산보다 크면
		right = mid - 1			// 상한선 감소
	} else {					// 주어진 예산 내에서 해결 가능
		left = mid + 1			// 상한선 증가
		answer = mid
	}
}

print(answer)
