import Foundation

func solution(_ s:String) -> [Int] {
    var target = s
    var answer: [Int] = []
    var radixCount = 0
    var removeZero = 0

    while target != "1" {
        /// 1을 제거한 숫자 -> 지워야하는 0의 개수
        removeZero += target.replacingOccurrences(of: "1", with: "").count
        radixCount += 1
        
        /// 0을 지운 문자열의 길이를 2진수로 변환
        target = String(target.replacingOccurrences(of: "0", with: "").count, radix: 2)
    }
    
    return [radixCount, removeZero]
}

/// 기존 방법
//    while target != "1" {
//        /// 0제거 이전, 0제거 이후의 글자수
//        let before = target.count
//        target = target.replacingOccurrences(of: "0", with: "")
//        let after = target.count
//        
//        /// 0제거 이후의 문자열 개수를 2진수로 변환
//        target = String(after, radix: 2)
//        
//        /// 제거된 0의 개수와 변경 횟수 계산
//        removeZero += (before - after)
//        radixCount += 1
//    }
