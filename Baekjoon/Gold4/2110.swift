// 2110 - 공유기 설치(2초, 128MB)

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let hCount = input[0], network = input[1]					// 집 수, 공유기 수
var home: [Int] = []

// 집 정보 입력받아 정렬
for _ in 0..<hCount {
	home.append(Int(readLine()!)!)
}

home.sort{ $0 < $1 }

var left = 1										// 공유기 설치 가능한 최소 거리 1
var right = home.last! - home.first!				// 공유기 설치 가능한 최대 거리: 가장 먼 집 - 가장 가까운 집
var answer = 0


// 전체 O(NlogN)
// O(logN)
while left <= right {
	let mid = (left + right) / 2
	var count = 1
	
	// 공유기 설치
	var installHome = home[0]
	
	for i in 1..<home.count {					// O(N)
		if home[i] - installHome >= mid {		// 현재 집 - 마지막 설치 위치 >= 지정 거리: 설치 가능한 경우
			installHome = home[i]				// 공유기 마지막 설치 위치 = 현재 집 위치
			count += 1							// 공유기 설치 횟수 추가
		}
	}
	
	if count >= network {			// 주어진 수만큼 공유기를 설치할 수 있는 경우
		left = mid + 1
		answer = mid
	} else {						// 그렇지 않은 경우
		right = mid - 1
	}
}

print(answer)
