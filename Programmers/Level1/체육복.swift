import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
 
    var reserve1 = reserve
    var lost1 = lost
    
		// 겹치는 학생 제외
    reserve1 = reserve.filter{!lost.contains($0)}.sorted()      // 여분의 체육복이 있고 도난 당한 학생, 사전순 정렬
    lost1 = lost.filter{!reserve.contains($0)}.sorted()         // 도난당했고 여분의 체육복이 있는 학생, 사전순 정렬
    
    var result = n - lost1.count                                // 전체 인원 - 도난 당한 인원
    for i in reserve1 {
        if lost1.contains(i-1) {                                // 왼쪽부터 확인
            lost1.remove(at: lost1.firstIndex(of: i-1)!)        // lost에서 체육복을 빌린 학생 제외
            result += 1
        } else if lost1.contains(i+1) {                         // 오른쪽 확인
            lost1.remove(at: lost1.firstIndex(of: i+1)!)        // lost에서 체육복을 빌린 학생 제외
            result += 1
        }
    }
    return result
}
