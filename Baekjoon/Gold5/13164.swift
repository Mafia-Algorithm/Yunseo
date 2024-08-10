// 13164 - 행복 유치원(1초, 512MB)
// 1 3 5 6 10		-> 아이들의 키
// 0 2 2 1 4		-> 각 아이들의 키 차이
// 그룹 간 차이가 가장 적으려면 키 차이가 가장 큰 구간에서 그룹화 하면 됨

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]

let height = readLine()!.split(separator: " ").map{Int(String($0))!}

// h와 h-1번째 아이의 키 차이 저장
var diff = Array(repeating: 0, count: height.count + 1)
for h in 1..<height.count {
	diff[h] = height[h] - height[h-1]
}

// 정렬 후 K-1개를 제외한 키 차이 모두 합하기
diff.sort{ $0 < $1 }
print(diff[0..<(diff.count-K+1)].reduce(0, +))
