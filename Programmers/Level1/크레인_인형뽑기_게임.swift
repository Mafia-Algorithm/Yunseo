import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var result = 0
    var bucket = [Int]()
    
    for m in moves {
        // 인형 뽑아서 넣기
        for i in 0..<board.count {
            if board[i][m-1] != 0 {
                bucket.append(board[i][m-1])
                board[i][m-1] = 0
                break
            }
        }
        if bucket.count > 1 {
            let last = bucket.last!
            let second = bucket[bucket.index(bucket.endIndex-1, offsetBy: -1)]  // 마지막에서 두번째 인형
            if last == second {
                bucket.removeLast()
                bucket.removeLast()
                result += 2
            }
        }
    }
    return result
}
