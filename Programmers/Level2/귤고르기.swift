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
