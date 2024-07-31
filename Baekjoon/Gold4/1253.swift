// 1253 - 좋다(2초, 256MB)

import Foundation

let N = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted{ $0 < $1 }			// 오름차순 정렬
var answer = 0

/// O(N^2)
for i in 0..<N {
	var left = 0						// 0 0 0 3의 경우 세번째 숫자 = 첫번째 + 두번째가 될 수 있기 때문에 범위 모두 포함
	var right = nums.count - 1
	while left < right {
		// i번째 숫자는 사용할 수 없음
		if left == i {
			left += 1
			continue
		} else if right == i {
			right -= 1
			continue
		}
		
		// 더한 수가 같다면 "좋다" 크거나 작다면 범위 조정
		let sum = nums[left] + nums[right]
		if sum == nums[i] {
			answer += 1
			break
		}
		if sum > nums[i] {
			right -= 1
		} else {
			left += 1
		}
	}
}

print(answer)

