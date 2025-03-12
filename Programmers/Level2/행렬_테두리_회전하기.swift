import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    // 행렬 구성
    var arrays = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    
    for r in 0..<rows {
        for c in 0..<columns {
            arrays[r][c] = r*columns + c + 1
        }
    }
    
    // 테두리 회전
    var answer: [Int] = []
    queries.forEach {
        let r1 = $0[0]-1, c1 = $0[1]-1, r2 = $0[2]-1, c2 = $0[3]-1  // 0, 0, 5, 5
        
        var temp = arrays[r1][c1]      // 이전 위치 값
        var minimum: [Int] = []
        minimum.append(temp)

        for c in c1..<c2 {
            (arrays[r1][c+1], temp) = (temp, arrays[r1][c+1])
            minimum.append(temp)
        }
        
        for r in r1..<r2 {
            (arrays[r+1][c2], temp) = (temp, arrays[r+1][c2])
            minimum.append(temp)
        }
        
        for c in (c1..<c2).reversed() {
            (arrays[r2][c], temp) = (temp, arrays[r2][c])
            minimum.append(temp)
        }
        
        for r in (r1..<r2).reversed() {
            (arrays[r][c1], temp) = (temp, arrays[r][c1])
            minimum.append(temp)
        }
        
        answer.append(minimum.min()!)                   // 회전한 값 중 가장 작은 값 정답 배열에 추가
    }
    
    return answer
}
