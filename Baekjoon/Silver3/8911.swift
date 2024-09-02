// 8911 - 거북이(1초, 128MB)

import Foundation

let TC = Int(readLine()!)!
var log = [[Int]]()     // 거북이 자취
var turtle = [0, 0]     // 거북이 현재 위치
var front = 0           // 거북이 앞 방향

let moveXY: [Int: [[Int]]] = [
    0: [[0, 1], [0, -1]],
    90: [[1, 0], [-1, 0]],
    180: [[0, -1], [0, 1]],
    270: [[-1, 0], [1, 0]]
]

for _ in 0..<TC {
    let command = readLine()!.map{String($0)}
    
    // 초기화
    turtle = [0, 0]
    log = [turtle]
    front = 0
    
    // 이동
    move(input: command)
    
    // 넓이 계산
    print(getArea())
}

func move(input: [String]) {
    for i in input {
        switch i {
        case "F":       // 앞
            turtle[0] += moveXY[front]![0][0]
            turtle[1] += moveXY[front]![0][1]
            log.append(turtle)
            break
        case "B":       // 뒤
            turtle[0] += moveXY[front]![1][0]
            turtle[1] += moveXY[front]![1][1]
            log.append(turtle)
            break
        case "L":       // 왼쪽 90도
            front = (front + 270) % 360
            break
        default:       // 오른쪽 90도
            front = (front + 90) % 360
            break
        }
    }
}


func getArea() -> Int {
    log.sort{ $0[0] < $1[0] }
    let minX = log.first![0]
    let maxX = log.last![0]
    
    log.sort{ $0[1] < $1[1] }
    let minY = log.first![1]
    let maxY = log.last![1]
    
    return (maxY - minY) * (maxX - minX)
}
