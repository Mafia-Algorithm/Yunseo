// N*N의 2차원 배열을 만들어서 관리
// 첫번째 경우: row값만 증가
// 두번째 경우: col값만 증가
// 세번째 경우: row, col값이 모두 감소
// 세 가지 경우가 N, N-1, ,,... 1회씩 반복

import Foundation

func solution(_ n:Int) -> [Int] {
    var answer = Array(repeating: Array(repeating: 0, count: n), count: n)
    var i = 0
    var row = -1
    var col = 0
    var num = 0
    
    while i <= n {
        if i % 3 == 0 {
            for j in 0..<n-i {          // row값 증가
                row += 1
                num += 1
                answer[row][col] = num
            }
        } else if i % 3 == 1 {
            for j in 0..<n-i {          // col값 증가
                col += 1
                num += 1
                answer[row][col] = num
            }
        } else if i % 3 == 2 {
            for j in 0..<n-i {          // row, col 감소
                row -= 1
                col -= 1
                num += 1
                answer[row][col] = num
            }
        }
        i += 1
    }
    
    return answer.flatMap{$0}.filter{$0 != 0}
}
