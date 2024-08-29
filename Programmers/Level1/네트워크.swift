import Foundation

var computerVisit = [Bool]()                // 컴퓨터 방문 여부 확인
var count = 0                                  // dfs 함수가 호출된 횟수 출력

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    computerVisit = Array(repeating: false, count: n)       // 방문 배열 초기화
    
    for i in 0..<n {
        if !computerVisit[i] {              // 1. 컴퓨터 방문 여부 확인
            if dfs(i, computers) {
                count += 1                    // 2. dfs 호출 횟수 출력
            }
        }
    }
    return count
}

func dfs(_ index: Int, _ computers: [[Int]]) -> Bool {
    for i in 0..<computers.count {
        if computers[index][i] == 1 && !computerVisit[i] && i != index {
            computerVisit[i] = true
            dfs(i, computers)
        }
    }
    return true
}
