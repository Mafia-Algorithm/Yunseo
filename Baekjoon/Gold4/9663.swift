import Foundation

let N = Int(readLine()!)!
var answer = 0
var rows: [Int] = []                                // 한 row에 하나의 퀸만 존재

func makeChess(_ count: Int, _ rows: inout [Int]) {
    if count == N {                                 // N개의 여왕을 모두 놓았을 때
        answer += 1
        return
    }
    
    for i in 0..<N {                                // 놓을 수 있는 col의 위치
        if rows.contains(i) { continue }            // 세로중복(X)
        
        var flag = true
        for j in 0..<rows.count {                   // 대각선중복(X)
            if abs(j-count) == abs(rows[j]-i) {
                flag = false
                break
            }
        }
        
        if flag {
            rows.append(i)
            makeChess(count+1, &rows)
            _ = rows.removeLast()
        }
    }
}

makeChess(0, &rows)
print(answer)
