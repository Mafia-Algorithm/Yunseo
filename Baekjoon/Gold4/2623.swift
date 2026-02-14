f board[ny][nx] == 0 {     // 치즈가 아닌 경우만 계속 탐색
                dfs(ny, nx)
            }
        }
    }
}

// dfs로 녹여야하는 치즈 확인 후 녹이기
func meltingCheese() {
    for r in 0..<h {
        for c in 0..<w {
            if board[r][c] == 1 && checked[r][c] {
                board[r][c] = 0
            }
        }
    }
}

// 현재 남아있는 치즈 개수 확인
func countCheese() -> Int {
    var cheeseCount = 0
    board.forEach { line in
        cheeseCount += line.filter{ $0 == 1 }.count
    }
    return cheeseCount
}

var time = 0
var lastCount = 0

while true {
    let currentCount = countCheese()        // 녹이기 전의 개수가 0개라면 종료
    if currentCount == 0 { break }
    
    // 1시간이 지난 뒤 다시 확인
    checked = Array(repeating: Array(repeating: false, count: w), count: h)
    checked[0][0] = true
    dfs(0, 0)
    meltingCheese()
    
    time += 1
    lastCount = currentCount                // 녹이기 전의 개수
}

print(time)
print(lastCount)

// 토마토 문제와 비슷함
// 토마토 문제는 사방으로 퍼지기 때문에 bfs로 풀었지만, 이건 모든 0이 아니라 바깥에 있는 0만 찾아야하기 때문에 dfs로 찾되, 1을 만나면 탐색을 중지하는 방식으로 구현

// 토마토 문제: 모든 익은 토마토(1)가 사방으로 동시에 퍼짐 -> BFS
// 치즈 문제: 치즈 내부에 갇힌 공기는 치즈를 녹이지 못하므로 (0,0)이라는 확실한 외부 공기 지점에서 시작해서 바깥쪽만 탐색

// 치즈 문제도 BFS가 가능하지만, DFS로 풀 땐 1을 만나면 벽처럼 탐색을 중지하는 것으로 설계
// checked = true로 마커만 남겨서 녹아야하는 치즈임을 알려줌

// 개선 포인트:
// 1. BFS 사용으로 더 직관적인 구현
// 2. 불필요한 checked 배열 초기화 제거
// 3. countCheese 최적화 (매번 전체 순회 대신 녹인 개수만큼 감소)

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let h = input[0], w = input[1]

var board: [[Int]] = []

for _ in 0..<h {
  // 2636 - 치즈
// 공기와 접촉된 칸은 한 시간이 지나면 녹아 없어짐
// 치즈 구멍 속에는 공기가 없음
// 구멍이 열리면 공기가 들어감

// 치즈가 모두 녹아 없어지는 데 걸리는 시간, 녹기 한 시간 전에 남아있는 치즈 조각이 놓여있는 칸의 개수

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let h = input[0], w = input[1]

var board: [[Int]] = []

for _ in 0..<h {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(line)
}

var checked = Array(repeating: Array(repeating: false, count: w), count: h)

let dy = [0, 0, 1, -1]
let dx = [1, -1, 0, 0]
func dfs(_ y: Int, _ x: Int) {
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        // 범위 내에 있고, 아직 탐색하지 않음,
        if (0..<w).contains(nx) && (0..<h).contains(ny) && !checked[ny][nx] {
            checked[ny][nx]  let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(line)
}

let dy = [0, 0, 1, -1]
let dx = [1, -1, 0, 0]

// BFS로 외부 공기와 접촉한 치즈 찾기
func findMeltingCheese() -> [(Int, Int)] {
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var queue: [(Int, Int)] = [(0, 0)]
    var melting: [(Int, Int)] = []
    
    visited[0][0] = true
    var index = 0
    
    while index < queue.count {
        let (y, x) = queue[index]
        index += 1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if (0..<h).contains(ny) && (0..<w).contains(nx) && !visited[ny][nx] {
                visited[ny][nx] = true
                
                if board[ny][nx] == 0 {
                    queue.append((ny, nx))
                } else {  // board[ny][nx] == 1
                    melting.append((ny, nx))
                }
            }
        }
    }
    
    return melting
}

var time = 0
var lastCount = 0

// 초기 치즈 개수 계산
var totalCheese = board.flatMap { $0 }.filter { $0 == 1 }.count

while totalCheese > 0 {
    lastCount = totalCheese
    
    // 녹을 치즈 찾기
    let meltingCheese = findMeltingCheese()
    
    // 치즈 녹이기
    for (y, x) in meltingCheese {
        board[y][x] = 0
    }
    
    totalCheese -= meltingCheese.count
    time += 1
}

print(time)
print(lastCount)

// ===== 주요 개선 사항 =====
// 1. DFS → BFS: 큐를 사용한 BFS로 변경하여 더 직관적
// 2. 치즈 개수 추적: 매번 전체 배열을 순회하는 대신, 녹인 개수만큼 빼기
// 3. 반환값 활용: findMeltingCheese()가 좌표 리스트를 반환하여 별도 함수 불필요
// 4. 조기 종료: totalCheese > 0 조건으로 while 루프 제어
// 5. checked 배열: 매 단계마다 새로 생성 (이전 상태 영향 없음)

