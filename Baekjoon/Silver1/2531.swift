// 2531 - 회전초밥(1초, 256MB)

// 2 <= N <= 30000, 2 <= d <= 3000, 2 <= k <= N, 1 <= c <= d

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], d = input[1], k = input[2], c = input[3]			// N: 접시 수, d: 가짓수, k: 연속접시, c: 쿠폰번호
var sushi: [Int] = []												// 스시 정보
var sushiType = Array(repeating: 0, count: d + 1)					// 스시 별 개수

// 초밥 종류 입력
for _  in 0..<N {
	sushi.append(Int(readLine()!)!)
}

var uniqueType = 0													// 초밥의 가짓수 저장

// 첫번째 윈도우 설정
for s in 0..<k {
	if sushiType[sushi[s]] == 0 {
		uniqueType += 1
	}
	sushiType[sushi[s]] += 1
}

// 첫번째 윈도우의 초밥 가짓수 계산 후 쿠폰 초밥 존재 여부 확인
var answer = uniqueType
if sushiType[c] == 0 {
	answer += 1
}

for i in 1..<N {				// i == start
	let next = (i + k - 1) % N	// 마지막으로 먹는 초밥의 위치
	
	// 제거되는 초밥
	sushiType[sushi[i-1]] -= 1
	if sushiType[sushi[i-1]] == 0 {
		uniqueType -= 1
	}
	
	// 새로 먹게 되는 초밥
	if sushiType[sushi[next]] == 0 {
		uniqueType += 1
	}
	sushiType[sushi[next]] += 1
	
	// 슬라이딩 윈도우 내에서 이벤트 초밥의 개수도 세주어야 함!!!
	var current = uniqueType
	if sushiType[c] == 0 {					// 쿠폰초밥이 없다면 + 1
		current += 1
	}
	
	answer = max(answer, current)
}

print(answer)
