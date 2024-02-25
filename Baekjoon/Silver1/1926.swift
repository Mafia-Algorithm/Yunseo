// 1926 - 그림

// 그림의 개수, 그림의 넓이가 가장 넓은 것의 넓이
// 가로 세로만 확인, 대각선은 연결된 그림이 아님

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var paper = [[Int]]()
var visit = Array(repeating: Array(repeating: false,count: input[1]), count: input[0])
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

for _ in 0..<input[0] {
    paper.append(readLine()!.split(separator:" ").map{Int(String($0))!})
}

var count = 0
var answer = [Int]()
for i in 0..<input[0] {
    for j in 0..<input[1] {
        count = 0
        dfs(i, j)
        if count != 0 {
            answer.append(count)
        }
    }
}

func dfs(_ y: Int, _ x: Int) {
    if !(0..<input[0]).contains(y) || !(0..<input[1]).contains(x) || paper[y][x] == 0 || visit[y][x] {
        return
    }
    
    count += 1
    visit[y][x] = true
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        dfs(ny, nx)
    }
}

print(answer.count)         // 그림 개수
if answer.count == 0 {      // 그림이 없다면
    print(0)
} else {
    print(answer.max()!)
}


