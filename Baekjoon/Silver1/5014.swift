// 5014 - 스타트링크

// U, D을 몇 번 눌러야하는지 출력
// 갈 수 없다면 "use the stairs" 출력
// 그리디..? BFS..?

import Foundation

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let F = input[0]            // F층으로 이루어진 고층건물
let S = input[1]            // 강호의 위치 S
let G = input[2]            // 스타트링크의 위치 G
let U = input[3]            // 위층 가는 버튼
let D = input[4]            // 아래층 가는 버튼
var visit = Array(repeating: false, count: F + 1)

// 출발과 목적지가 같은 경우
if S == G {
    print("0")
    exit(0)
}

var answer = [Int]()
func bfs(_ start: Int) {
    visit[start] = true
    var queue: [(Int, Int)] = [(S, 0)]
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        
        let up = now.0 + U
        let down = now.0 - D
        
        // 원하는 층수에 도달했을 때
        if up == G || down == G {
            answer.append(now.1 + 1)
            break
        }
        
        // 범위 내에 있고 한 번도 방문하지 않은 경우
        if up <= F && !visit[up] {
            visit[up] = true
            queue.append((up, now.1 + 1))
        }
        if down > 0 && !visit[down] {
            visit[down] = true
            queue.append((down, now.1 + 1))
        }
    }
}
    
bfs(S)
if answer.isEmpty {         // 갈 수 없는 경우
    print("use the stairs")
} else {
    print(answer.min()!)
}

