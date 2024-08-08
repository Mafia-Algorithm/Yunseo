// 2212 - 센서(2초, 128MB)

import Foundation

let N = Int(readLine()!)!		// 센서 개수
let K = Int(readLine()!)!		// 집중국 개수
var sensor = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var dist = Array(repeating: 0, count: N+1)

// 센서 개수 하나 또는 집중국 하나인 경우 센서의 마지막 - 센서의 처음 위치
if K == 1 || N == 1 {
	print(sensor.last! - sensor.first!)
	exit(0)
}

// dist[s] = s번째 센서와 s-1번째 센서의 거리 차이
for s in 1..<sensor.count {
	dist[s] = sensor[s] - sensor[s-1]
}
dist.sort()
print(dist[0..<dist.count-K+1].reduce(0, +))

// 만약 1 3 6 6 7 9에서 2개의 집중국을 설치한다면
// 거리값 : [0, 2, 3, 0, 1, 2]
// 거리값 5개 중 가장 큰 거리 1개만 제외하고 설치하면 됨
// [1, 3], [6, 6, 7, 9]

// 같은 맥락으로 3개의 집중국을 설치한다면 거리값 중 3-1개만 제외하고 설치하면 됨
// [1, 3], [6, 6, 7], [9]
