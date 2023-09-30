import Foundation

func solution(_ dartResult:String) -> Int {
    var score: Double = 0
    var result = [Double]()
    let dict: [String: Double] = ["S": 1, "D": 2, "T": 3]
    
    for d in dartResult {
        /// 숫자가 나올 때까지 score에 저장
        if d.isNumber {
            score = score * 10 + Double(String(d))!
        } else if d.isLetter {                            // 문자 나오면 S, D, T에 따라 제곱
            result.append(pow(score, dict[String(d)]!))
            score = 0                                     // 숫자 초기화
        } else if d == "*" {                              // 스타상
            if result.count > 1 {                         // 마지막 숫자와 이전 숫자 2배
                result[result.endIndex-1] *= 2
                result[result.endIndex - 2] *= 2
            } else {                                      // 첫번째 숫자인 경우 첫번째 숫자만 2배
                result[0] *= 2
            }
        } else if d == "#" {                              // 아차상인 경우 현재 숫자 -1 곱하기
            result.append(result.removeLast() * (-1))
        }
    }
    
    return Int(result.reduce(0, +))                       // 모든 숫자 합하기
}
