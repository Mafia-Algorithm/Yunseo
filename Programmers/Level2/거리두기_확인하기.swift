import Foundation

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]
var visit = Array(repeating: Array(repeating: false, count: 5), count: 5)
var count = 0


func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
    // 각 TC 결과값 result에 저장
    for p in places {
        result.append(bfs(p))
    }
    
    return result
}

func bfs(_ places: [String]) -> Int {
    var pList = [(Int, Int)]()
    var place = [[String]]()
    var distance = Array(repeating: Array(repeating: 0, count: 5), count: 5)
    // P의 위치 저장
    for i in 0..<5 {
        var rowPlace = places[i].map{String($0)}
        place.append(rowPlace)
        for j in 0..<5 {
            if rowPlace[j] == "P" {
                pList.append((i, j))
            }
        }
    }
    
    for p in pList {
        distance = Array(repeating: Array(repeating: 0, count: 5), count: 5)
        visit = Array(repeating: Array(repeating: false, count: 5), count: 5)
        var queue = [(Int, Int)]()
        queue.append(p)
        visit[p.0][p.1] = true
        while !queue.isEmpty {
            var (r, c) = queue.removeFirst()
            
            for i in 0..<4 {
                let nc = c + dx[i]
                let nr = r + dy[i]
                
                if (0..<5).contains(nr) && (0..<5).contains(nc) && !visit[nr][nc]{
                    if place[nr][nc] == "O" {
                        distance[nr][nc] = distance[r][c] + 1
                        visit[nr][nc] = true
                        queue.append((nr, nc))
                    } else if place[nr][nc] == "P"  && distance[r][c] <= 1 {
                        return 0
                    }
                }
            }
        }
    }
    return 1
}
