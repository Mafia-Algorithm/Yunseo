import Foundation

// 1:1
// 2:1 -> 1/2
// 3:2 -> 2/3
// 4:3 -> 3/4
// 4C2 = 4 * 3 / 2
func solution(_ weights:[Int]) -> Int64 {
    var weights = weights
    var dict: [Double: Int] = [:]
    var answer = 0
    
    // 각 몸무게 몇 명 있는지 구하기
    for w in weights {
        let w = Double(w)
        if dict[w] != nil {
            dict[w]! += 1
        } else {
            dict[w] = 1
        }
    }
    
    for (w, v) in dict {
        if dict[w]! > 1 {            // 나와 같은 몸무게가 1개 이상인 경우 -> nC2
            answer += (dict[w]! * (dict[w]! - 1)) / 2
        }
        
        // 180이 2명이고, 360이 3명일 때 -> 6쌍 나와야 함
        if dict[w*2] != nil {
            answer += dict[w]! * dict[w*2]!
        }
        if dict[w*3/2] != nil {
            answer += dict[w]! * dict[w*3/2]!
        }
        if dict[w*4/3] != nil {
            answer += dict[w]! * dict[w*4/3]!
        }
    }
    
    return Int64(answer)
}
