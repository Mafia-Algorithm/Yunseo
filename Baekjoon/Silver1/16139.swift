// 16139 - 인간 - 컴퓨터 상호작용

import Foundation

var S = readLine()!.map{String($0)}
var count = Int(readLine()!)!
var sum: [[Int]] = [Array(repeating: 0, count: 26)]

sum[0][Int(UnicodeScalar(S[0])!.value) - Int(UnicodeScalar("a").value)] += 1

// i번째 글자까지 확인했을 때 각 알파벳의 개수
for i in 1..<S.count {
	sum.append(sum[i-1])
	sum[i][Int(UnicodeScalar(S[i])!.value) - Int(UnicodeScalar("a").value)] += 1
}

for _ in 0..<count {
	let input = readLine()!.split(separator: " ").map{String($0)}
	let index = Int(UnicodeScalar(input[0])!.value) - Int(UnicodeScalar("a").value)			// 개수를 구하려는 알파벳
	let start = Int(input[1])!																// 시작 범위
	let end = Int(input[2])!																// 마지막 범위
	
	if start != 0 {					// 중간부터 확인하는 경우 ex) 3~5이면 5번째에서 2번째를 빼야함
		print(sum[end][index] - sum[start-1][index])
	} else {						// 처음부터 확인하는 경우
		print(sum[end][index])
	}
}
