// 1303 - 전쟁-전투

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var soldier = [[String]]()
var visit = Array(repeating: Array(repeating: false, count: input[0]), count: input[1])

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

for _ in 0..<input[1] {
    soldier.append(readLine()!.map{String($0)})
}

var white = 0
var blue = 0
var temp = 0

for i in 0..<input[1] {
    for j in 0..<input[0] {
        if !visit[i][j] {
            temp = 0
            dfs(i, j, soldier[i][j])
            if soldier[i][j] == "W" {
                white += temp * temp
            } else {
                blue += temp * temp
            }
        }
    }
}

func dfs(_ y: Int, _ x: Int, _ color: String) {
    visit[y][x] = true
    temp += 1
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if !(0..<input[1]).contains(ny) || !(0..<input[0]).contains(nx) || visit[ny][nx] || soldier[ny][nx] != color {
            continue
        }
        dfs(ny, nx, color)
    }
    return
}
