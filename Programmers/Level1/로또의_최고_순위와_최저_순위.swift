import Foundation

// 숫자의 순서는 상관 없음

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zeroCount = lottos.filter{$0 == 0}.count
    var sameNumber = lottos.filter{win_nums.contains($0)}.count
    
    let high = (zeroCount+sameNumber) == 0 ? 6 : 7 - (zeroCount+sameNumber)
    let low = sameNumber == 0 ? 6 : 7 - sameNumber
    return [high, low]
}
