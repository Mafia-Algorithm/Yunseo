import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    // A, B 오름차순 정렬
    var answer = b.count
    var aSorted = a.sorted{ $0 < $1 }   
    var bSorted = b.sorted{ $0 < $1 }
    
    // A, B 둘 다 원소가 남아있을 때
    while !aSorted.isEmpty && !bSorted.isEmpty {
        let aLast = aSorted.last!
        let bLast = bSorted.last!
        
        if aLast >= bLast {                 // A팀 숫자가 더 큰 경우(B가 승점을 얻지 못하는 경우)
            _ = aSorted.removeLast()
        } else if aLast < bLast {           // B팀 숫자가 더 큰 경우(B가 승점을 얻는 경우)
            _ = aSorted.removeLast()
            _ = bSorted.removeLast()
        }
    }
    
    return answer - bSorted.count
}
