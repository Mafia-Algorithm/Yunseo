// ⭐️대각선을 거를 때 주의할 점
// abs(row1-row2) / abs(col1-col2) == 1일 때만 거르면 기울기가 -1일 때는 거르지 못함
// 때문에 값이 같다로 대각선에 위치하는지 판별
// 그리고 4 / 3 = 1이기 때문에 올바른 대각선 관계를 판단할 수 없음.

import Foundation

func solution(_ n:Int) -> Int {
    var rows = Array(repeating: -1, count: n)       // row별 col의 좌표 수(가로 중복 제외)
    var answer = 0
    
    func permutation(_ count: Int, _ temp: inout [Int]) {
        if count == n && temp.count == n { 
            answer += 1
        }
        
        for col in 0..<n {                            // n번째 퀸을 놓을 차례
            var flag = true
            if temp.contains(col) { continue }        // 세로 중복 제외
            
            for row in 0..<temp.count {               // 대각선 중복 제외
                if abs(row-count) == abs(temp[row]-col) {
                    flag = false
                    break
                }
            }
            
            if flag {
                temp.append(col)
                permutation(count+1, &temp)
                _ = temp.removeLast()
            }
        }
    }
    
    var temp = [Int]()
    permutation(0, &temp)
    
    return answer
}
