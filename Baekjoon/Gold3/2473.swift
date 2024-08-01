// 2473 - 세 용액

import Foundation

let N = Int(readLine()!)!
var solution = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted{$0 < $1}
var current = Int.max
var answer: [Int] = []

/// O(N^2)
for i in 0..<solution.count {
	let first = solution[i]				// 첫번째 용액
	var left = 0
	var right = solution.count - 1
	while left < right {				// 같은 용액 사용 불가
		if left == i {
			left += 1
			continue
		} else if right == i {
			right -= 1
			continue
		}
		
		// 용액 특성 계산
		let value = first + solution[left] + solution[right]
		
		// 0에 더 가깝다면 업데이트
		if abs(value) < abs(current) {
			answer = [first, solution[left], solution[right]]
			current = value
		}
		
		// 0이라면 더 이상 보지 않고 출력
		if value == 0 {
			answer.sorted{ $0 < $1 }.forEach {
				print($0, terminator: " ")
			}
			exit(0)
		} else if value > 0 {
			right -= 1
		} else if value < 0 {
			left += 1
		}
	}
}

answer.sorted{ $0 < $1 }.forEach {
	print($0, terminator: " ")
}

