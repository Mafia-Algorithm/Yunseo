import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let R = input[0]            // 행
let C = input[1]            // 열
var field = [[String]]()
var visit = Array(repeating: Array(repeating: false, count: C), count: R)

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

for _ in 0..<R {
    field.append(readLine()!.map{String($0)})
}

var o = 0
var v = 0
func dfs(_ y: Int, _ x: Int) {
    if field[y][x] == "o" {
        o += 1
    } else if field[y][x] == "v" {
        v += 1
    }
    
    visit[y][x] = true
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if (0..<R).contains(ny) && (0..<C).contains(nx) && !visit[ny][nx] && field[ny][nx] != "#" {
            dfs(ny, nx)
        }
    }
}

var answerO = 0
var answerV = 0
for i in 0..<R {
    for j in 0..<C {
        if !visit[i][j] && field[i][j] != "#" {
            dfs(i, j)
            if o > v {
                answerO += o
            } else {
                answerV += v
            }
        }

        o = 0
        v = 0
    }
}
print(answerO, answerV)

