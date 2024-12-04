import Foundation

// 1. 시작 위치와 목표지점 찾기
// 2. BFS 사용

func solution(_ board:[String]) -> Int {
    var boards = [[String]]()
    var visit = Array(repeating: Array(repeating: -1, count: board[0].count), count: board.count)
    var answer = 0
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    for i in 0..<board.count {
        boards.append(board[i].map{String($0)})
    }
    
    func bfs() {
        var queue = [start]
        
        var index = 0
        while index < queue.count {
            let first = queue[index]
            
            for i in 0..<dx.count {
                var x = first.1
                var y = first.0
                while true {
                    x += dx[i]
                    y += dy[i]
                    if !((0..<board.count).contains(y) && (0..<board[0].count).contains(x)) { break }
                    if boards[y][x] == "D" { break }
                }
                var ny = y - dy[i]
                var nx = x - dx[i]
                
                if visit[ny][nx] == -1 {
                    visit[ny][nx] = visit[first.0][first.1] + 1
                    queue.append((ny, nx))
                }
            }
            index += 1
        }
    }
    
    var start: (Int, Int) = (0, 0)
    var goal: (Int, Int) = (0, 0)
    for i in 0..<boards.count {
        let line = boards[i]
        if line.contains("R") || line.contains("G") {
            for j in 0..<line.count {
                if line[j] == "R" {
                    start = (i, j)
                    visit[i][j] = 0
                } else if line[j] == "G" {
                    goal = (i, j)
                }
            }
        }
    }
    bfs()
    return visit[goal.0][goal.1]
}
