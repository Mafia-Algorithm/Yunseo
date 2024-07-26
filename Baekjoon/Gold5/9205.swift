// 9205 - 맥주 마시면서 걸어가기
/// 50 * 100 = 50000 -> 완전탐색
/// 편의점 정렬해서 순차적으로 확인하는 방법은 X, (1, 0), (0, 1)있을 때 (1, 0)은 다음 편의점까지 갈 수 있지만 (0,1)은 다음 편의점까지 못갈 수도 있음
/// BFS로 다음 경로가 가능한 모든 편의점을 큐에 넣어야 함

import Foundation

let TC = Int(readLine()!)!

func bfs(_ start: [Int], _ stores: [[Int]], _ visit: inout [Bool], _ festival: [Int]) -> Bool {
	var queue: [[Int]] = [start]
	var index = 0
	
	while index < queue.count {
		let now = queue[index]
		
		/// 페스티벌에 갈 수 있다면 종료
		if abs(festival[1] - now[1]) + abs(festival[0] - now[0]) <= 1000 {
			return true
		}
		
		for (i, s) in stores.enumerated() {
			let distance = abs(s[1] - now[1]) + abs(s[0] - now[0])
			
			/// 다음 편의점까지 거리가 1000이하고 방문하지 않았다면
			if distance <= 1000 && !visit[i] {
				queue.append(s)
				visit[i] = true
			}
		}
		index += 1
	}
	return false
}

for _ in 0..<TC {
	let storeCount = Int(readLine()!)!												// 편의점 수
	let home: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}		// 상근이 집
	
	// 편의점 정보 입력, 방문 처리
	var stores: [[Int]] = []
	for _ in 0..<storeCount {
		stores.append(readLine()!.split(separator: " ").map{Int(String($0))!})
	}
	var visit = Array(repeating: false, count: storeCount)
	
	let festival = readLine()!.split(separator: " ").map{Int(String($0))!}			// 페스티벌 위치
	
	// bfs로 탐색 성공, 실패 분리
	if bfs(home, stores, &visit, festival) {
		print("happy")
	} else {
		print("sad")
	}
}
