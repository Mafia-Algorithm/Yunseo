// 14500 - 테트로미노
// N * M 종이 위에 테트로미노 하나를 놓으려고 한다. 각각의 칸에는 정수가 하나 쓰여 있다.
// 정사각형은 겹치면 안됨
// 도형은 모두 연결되어 있어야 함
// 정사각형의 변끼리 연결되어 있어야 함.
// 회전이나 대칭 가능
// 테트로미노가 놓인 칸에 쓰여 있는 수들의 합을 최대로 하는 프로그램을 작성해라.

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]

var board: [[Int]] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(line)
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
let dx = [0, 1, 0, -1]
let dy = [-1, 0, 1, 0]

var answer = 0

// DFS로 4칸을 탐색 (ㅗ 모양 제외)
func dfs(_ x: Int, _ y: Int, _ depth: Int, _ sum: Int) {
    if depth == 4 {
        answer = max(answer, sum)
        return
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || nx >= m || ny < 0 || ny >= n {
            continue
        }
        
        if visited[ny][nx] {
            continue
        }
        
        visited[ny][nx] = true
        dfs(nx, ny, depth + 1, sum + board[ny][nx])
        visited[ny][nx] = false
    }
}

// ㅗ, ㅜ, ㅏ, ㅓ 모양은 별도 처리 (DFS로 불가능)
func checkT(_ x: Int, _ y: Int) {
    // ㅗ
    if (1..<m-1).contains(x) && (1..<n).contains(y) {
        let sum = board[y][x] + board[y][x-1] + board[y][x+1] + board[y-1][x]
        answer = max(answer, sum)
    }
    // ㅜ
    if (1..<m-1).contains(x) && (0..<n-1).contains(y) {
        let sum = board[y][x] + board[y][x-1] + board[y][x+1] + board[y+1][x]
        answer = max(answer, sum)
    }
    // ㅓ
    if (1..<m).contains(x) && (1..<n-1).contains(y) {
        let sum = board[y][x] + board[y-1][x] + board[y+1][x] + board[y][x-1]
        answer = max(answer, sum)
    }
    // ㅏ
    if (0..<m-1).contains(x) && (1..<n-1).contains(y) {
        let sum = board[y][x] + board[y-1][x] + board[y+1][x] + board[y][x+1]
        answer = max(answer, sum)
    }
}

for r in 0..<n {
    for c in 0..<m {
        visited[r][c] = true
        dfs(c, r, 1, board[r][c])
        visited[r][c] = false
        
        checkT(c, r)
    }
}

print(answer)

