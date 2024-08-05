// 12904 - A와 B(2초, 512MB)

// 1, 문자열 뒤에 A추가 -> 뒤에서 A 제거
// 2. 문자열 뒤집고 뒤에 B 추가 -> 뒤에서 B 제거하고 뒤집기
// S <= 999, T<=1000
// 바꿀 수 있으면 1, 없으면 0 출력

import Foundation

var S = readLine()!.map{String($0)}
var T = readLine()!.map{String($0)}

// T -> S로 가는 방법이 있는지 찾는게 더 빠르지 않을까?
var left = 0
var right = T.count - 1
var direction = 0					// 0 이 정방향, 1이 역방향
while right - left + 1 > S.count {
	if direction == 0 {				// 정방향인 경우
		if T[right] == "B" {		// 마지막이 B라면 뒤집기
			direction = 1
		}
		right -= 1					// A이든 B이든 마지막 알파벳 제거
	} else if direction == 1 {		// 역방향인 경우
		if T[left] == "B" {			// 첫문자가 B라면 뒤집기
			direction = 0
		}
		left += 1					// 첫번째 알파벳 제거
	}
}

// 정방향이면 left...right, 역방향이면 reversed()
var str = direction == 0 ? Array(T[left...right]) : T[left...right].reversed()
S == str ? print(1) : print(0)
