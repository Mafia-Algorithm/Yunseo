import Foundation

func solution(_ board:[[Int]]) -> Int {
    let rowCount = board.count
    let colCount = board[0].count
    var dp = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    // 첫번째 열과 첫번째 행은 board의 초깃값과 같음
    dp[0] = board[0]
    (0..<rowCount).forEach {
        dp[$0][0] = board[$0][0]
    }
    
    for r in 1..<rowCount {
        for c in 1..<colCount {
            if board[r][c] == 1 {
                /// 왼쪽, 위쪽, 대각선 왼위쪽이 모두 정사각형을 만들 수 있는 경우
                /// 현재 위치에서 만들 수 있는 가장 큰 정사각형의 변 = 이 중 가장 작은 변 + 1
                if dp[r-1][c-1] != 0 && dp[r-1][c] != 0 && dp[r][c-1] != 0 {
                    dp[r][c] = min(dp[r-1][c-1], dp[r-1][c], dp[r][c-1]) + 1
                } else {
                    dp[r][c] = 1
                }
            }
        }
    }
    let maxLength = dp.flatMap{ $0 }.max()!
    
    return maxLength * maxLength
}

// 규칙 dp[r][c]: (r,c)에서 만들 수 있는 가장 큰 정사각형의 넓이
// 효율성을 위해 dp에 넓이 대신 정사각형의 변의 길이를 저장함.

// case1) 
// 1 1 1 1
// 1 1 1 1
// 1 1 1 1
// 1 1 1 1

// 1 1 1 1
// 1 4 4 4
// 1 4 9 9
// 1 4 9 16

// case2) 대각선 왼위, 왼쪽, 위쪽이 모두 정사각형을 만들 수 있어야 함.
// 0 1 1 1
// 1 1 1 1
// 1 1 1 1
// 0 0 1 0

// 0 1 1 1
// 1 1 4 4
// 1 4 4 9
// 0 0 1 0

// case3)
// 0 1 1 1
// 1 0 1 1
// 1 1 1 1
// 0 0 1 0

// 0 1 1 1
// 1 0 1 1
// 1 1 1 4
// 0 0 1 0

// case4) 찾지 못한 예외 케이스‼️
// 1 1 0
// 1 1 1
// 0 1 1

// 1 1 0
// 1 4 1
// 0 1 4
// -> dp[1][1]은 4지만 dp[2][2]가 9가 되지 않음
// -> 왼쪽, 위쪽, 대각선 왼위의 값 중 최솟값 + 1을 해야 함.

