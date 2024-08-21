//  PRG - 네트워크

//1. 컴퓨터 방문 여부 확인
//2. computers에서 제공된 정보로 연결된 컴퓨터 확인
//3. dfs/bfs 호출 횟수 출력

import Foundation

var computerVisit = [Bool]()                // 컴퓨터 방문 여부 확인
var count = 0                                  // dfs 함수가 호출된 횟수 출력

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    computerVisit = Array(repeating: false, count: n)       // 방문 배열 초기화
    
    for i in 0..<n {
        if !computerVisit[i] {              // 1. 컴퓨터 방문 여부 확인
            if dfs(i, computers) {
                count += 1                    // 3. dfs 호출 횟수 출력
            }
        }
    }
    return count
}

func dfs(_ index: Int, _ computers: [[Int]]) -> Bool {
    for i in 0..<computers.count {
        // 1. 연결되어있는지 여부, 2. 이미 방문했는지 확인, 3. 자기 자신이 아닌지 확인
        if computers[index][i] == 1 && !computerVisit[i] && i != index {
            computerVisit[i] = true                 // 방문 여부 변경 후
            dfs(i, computers)                           // 2. 연결되어 있는 컴퓨터의 computers 배열 확인
        }
    }
    return true
}

//solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])

