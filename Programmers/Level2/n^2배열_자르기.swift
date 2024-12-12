// 123/456/789
// 123/223/333

// 1234/5678/9101112/13141516
// 1234/2234/33 3 4 /4 4 4 4

/// 내가 찾은 규칙
// 1~n = 1~n
// n+1~2n = 2*(n으로 나눈 몫+1만큼 반복)~n-1
// 2n+1 ~ 3n = 3*(n으로 나눈 몫+1만큼 반복)~n-2

import Foundation

/// 내가 생각한 방법1)
func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var answer = [Int]()
    
    for i in left...right {
        var i = Int(i+1)
        var temp = i / n                        // 몫
        var remain = i % n                      // 나머지
        if remain == 0 { answer.append(n) }     // 나누어 떨어지는 경우 자기자신(가장 오른쪽)
        else if remain <= temp {                // 나머지 <= 몫 인 경우 -> 몫+1
            answer.append(temp+1)
        } else {                                // 그 외의 경우 나머지와 같음
            answer.append(remain)
        }
    }
    
    return answer
}


/// 방법2) 더 좋은 규칙.. i번째 값 == row와 col 중 최대값 + 1
// func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
//     return (left...right).map{max(Int($0)/n, Int($0)%n) + 1}
// }

