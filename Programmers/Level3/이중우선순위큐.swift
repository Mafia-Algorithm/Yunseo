import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    
    operations.forEach {
        let op = $0.components(separatedBy: .whitespaces)
        if op[0] == "I" {               // 삽입 연산
            queue.append(Int(op[1])!)
        } else if op[0] == "D" && !queue.isEmpty {  // 삭제 연산, 큐가 비어있지 않은 경우
            if op[1] == "1" {           // 최댓값 삭제
                queue.remove(at: queue.firstIndex(of: queue.max()!)!)
            } else {                    // 최솟값 삭제
                queue.remove(at: queue.firstIndex(of: queue.min()!)!)
            }
        }
    }
    
    if queue.isEmpty { return [0, 0] }
    return [queue.max()!, queue.min()!]
}
