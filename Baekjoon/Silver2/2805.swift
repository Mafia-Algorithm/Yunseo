// 2805 - 나무자르기(1초, 256MB)
// 나무 높이 <= 1,000,000,000 -> Int로 가능 사용
// 자를 수 있는 나무의 최대 높이 구함 -> 자른 길이가 조건을 만족할 때 left++
// 자른 길이가 조건을 만족하지 못할 때 right--

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]		// N 나무의 개수, M 나무의 길이
var trees: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}

var left = 1
var right = trees.max()!
var answer = 0

while left <= right {
	var count = 0
	let mid = (left + right) / 2
	
	trees.forEach {
		if $0 > mid {
			count += ($0 - mid)
		}
	}
	
	// 자른 길이가 조건을 만족할 때 left++, 만족하지 못할 때 right--
	if count >= M {
		left = mid + 1
		answer = mid
	} else {
		right = mid - 1
	}
}

print(answer)
