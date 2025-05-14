// line개수 <= 1000 O(n^2) 가능
// 좌표값이 10^10일 수 있으므로 Int64를 꼭 해주어야 함.
import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var points: [(Int64, Int64)] = []
    var maxY: Int64 = Int64.min
    var minY: Int64 = Int64.max
    var maxX: Int64 = Int64.min
    var minX: Int64 = Int64.max
    
    for i in 0..<line.count {
        let line1 = line[i].map{Int64($0)}
        for j in i+1..<line.count {
            let line2 = line[j].map{Int64($0)}
            guard let point = findAnswer(line1, line2) else { continue }
            points.append(point)
            
            // 현재 좌표값에 따라 y, x의 최대, 최소값 업데이트
            maxY = maxY > point.0 ? maxY : point.0
            maxX = maxX > point.1 ? maxX : point.1
            minY = minY < point.0 ? minY : point.0
            minX = minX < point.1 ? minX : point.1
        }
    }
    
    var answer = Array(repeating: Array(repeating: ".", count: Int(maxX - minX + 1)), count: Int(maxY - minY + 1))
    
    // 좌표에 맞게 별 추가
    for point in points {
        let y = point.0, x = point.1
        answer[Int(maxY-y)][Int(x-minX)] = "*"
    }

    return answer.map{$0.joined(separator: "")}
}

// 두 직선의 교점 찾기
func findAnswer(_ line1: [Int64], _ line2: [Int64]) -> (Int64, Int64)? {
    var line1 = line1
    var line2 = line2
    
    let A = line1[0], B = line1[1], E = line1[2]
    let C = line2[0], D = line2[1], F = line2[2]
    
    // divide by Zero 방지
    if A*D != B*C && (E*C-A*F)%(A*D-B*C) == 0 && (B*F-E*D)%(A*D-B*C) == 0 {
        return ((E*C-A*F)/(A*D-B*C), (B*F-E*D)/(A*D-B*C))
    }
    
    return nil
}
