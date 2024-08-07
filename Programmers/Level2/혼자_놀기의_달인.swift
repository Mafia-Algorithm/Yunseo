import Foundation

// 상자 분류
// 분류가 하나라면 0점
// 분류가 여러개인 경우 -> 다 열릴 때까지 반복
// 분류 별 상자 개수 저장 후 내림차순 정렬
// 상위 2개의 값을 곱한 것이 정답

func solution(_ cards:[Int]) -> Int {
    var answer = 0
    var boxKind: [Int] = []
    var cards = [0] + cards
    var used = Array(repeating: false, count: cards.count + 1)
    used[0] = true
    
    for i in 0..<cards.count {
        if used[i] { continue }                 // 이미 열린 상자면 continue
        
        let startBox = cards[i]                 // 지금 여는 상자
        var groupCount = 1
        used[startBox] = true                   // 언박싱
        
        var nextBox = cards[startBox]           // 다음으로 여는 상자
        while !used[nextBox] {
            if used[nextBox] { break }
            
            // 다음 상자를 사용하지 않았다면 사용처리 후 다음 열 상자 업데이트
            used[nextBox] = true
            nextBox = cards[nextBox]
            groupCount += 1
        }
        
        // 분류 내에 있는 상자 개수 저장
        boxKind.append(groupCount)
    }
    
    // 내림차순 정렬
    boxKind.sort{ $0 > $1 }
    
    return boxKind.count >= 2 ? boxKind[0] * boxKind[1] : 0
}
