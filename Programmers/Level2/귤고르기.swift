import Foundation

// k개 고름
// 크기별로 분류 -> 다른 종류의 수를 최소화
// 1, 3, 2, 5, 4, 5, 2, 3
// 1:1, 2:2, 3:2, 4:1, 5:2

// 해결
// dictionary 사용 -> 개수 많은 순으로 정렬

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict: [Int: Int] = [:]
    
    for t in tangerine {
        dict[t, default: 0] += 1
    }
    var sortDict = dict.sorted{$0.value > $1.value }
    
    var temp = 0
    var kind = 0
    for (key, value) in sortDict {
        temp += value
        kind += 1
        
        if temp >= k {
            break
        }
    }
    
    return kind
}

import Foundation

// 1. 귤 종류 별 개수 구하기
// 2. 개수가 많은 순으로 정렬
// 3. k개를 충족할 때까지 귤 사용
// 4. k개 이상이면 반환
// Dictionary(grouping: ) 이용하는 법

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tangerineKind = Dictionary(grouping: tangerine) {$0}.values
        .sorted{$0.count > $1.count}
    
    var kind = 0
    var tangerCount = 0
    for t in tangerineKind {
        tangerCount += t.count
        kind += 1
        
        if tangerCount >= k { return kind }
    }
    
    return 0
}
