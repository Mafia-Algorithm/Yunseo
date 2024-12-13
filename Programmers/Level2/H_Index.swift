// n편 중 h번 이상 인용된 논문이 h편 이상 && 나머지 논문이 h번 이하 인용
// h의 최댓값이 H-index

import Foundation

//방법1) 이분탐색
func solution(_ citations:[Int]) -> Int {
    var answer = 0
    var left = 0
    var right = citations.max()!
    var mid = (left + right) / 2
    
    while left <= right {
        mid = (left + right) / 2
        
        if citations.filter{$0 >= mid}.count >= mid {
            left = mid+1
            answer = mid
        } else {
            right = mid-1
        }
    }
    
    return answer
}

// 방법2) 반복문 활용
// i번째 논문이 i번 이상 인용되었다면 H-Index가 될 수 있음
// index는 0부터 시작이므로 i+1로 계산
func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)     // 논문 오름차순 정렬
    var hIndex = 0
    
    for i in 0..<citations.count {
        if i+1 <= citations[i] {        // h번 이상 인용된 논문이 h개 이상
            hIndex = i+1
        }
    }
    
    return hIndex
}
