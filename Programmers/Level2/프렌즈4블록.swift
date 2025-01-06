// 1. 2*2인 부분의 시작점 찾기
// 2. 빈 공간으로 만들기
// 3. 블록 아래로 떨어뜨리기
// 1이 없을 때까지 1~3반복

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map{$0.map{String($0)}}
    var answer = 0

    // 2 * 2 지점 찾기
    func findSquare(_ y: Int, _ x: Int) -> Bool {
        let block = board[y][x]
        return board[y+1][x] == block && board[y][x+1] == block && board[y+1][x+1] == block
    }
    
    // 지우기
    func erase(_ startList: [[Int]]) {
        for list in startList {
            if board[list[0]][list[1]] != "" {
                board[list[0]][list[1]] = ""
                answer += 1
            }
            if board[list[0]+1][list[1]] != "" {
                board[list[0]+1][list[1]] = ""
                answer += 1
            }
            if board[list[0]][list[1]+1] != "" {
                board[list[0]][list[1]+1] = ""
                answer += 1
            }
            if board[list[0]+1][list[1]+1] != "" {
                board[list[0]+1][list[1]+1] = ""
                answer += 1
            }
        }
    }
    
    // 내리기
    func gravity() {
        for c in stride(from:board[0].count-1, to: -1, by: -1) {
            for r in stride(from: board.count-1, to: -1, by: -1) {
                var row = r
                if board[row][c] == "" {
                    while row > 0 && board[row][c] == "" {  // row는 내릴 블록위치
                        row -= 1
                    }
                    board[r][c] = board[row][c]
                    board[row][c] = ""
                }
            }
        }
    }
    
    var squareStart = [[Int]]()
    while true {
        squareStart = []
        for r in 0..<board.count-1 {
            for c in 0..<board[0].count-1 {
                if board[r][c] != "" {      // 비어있지 않고
                    if findSquare(r, c) {   // 시작점이라면
                        squareStart.append([r, c])
                    }
                }
            }
        }
        if squareStart.isEmpty { break }   // 2*2가 없다면 종료
        
        // 2*2가 있다면 지우고 내리기
        erase(squareStart)
        gravity()
    }
    
    return answer
}
