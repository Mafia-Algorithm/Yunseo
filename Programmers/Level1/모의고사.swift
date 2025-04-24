// 1번 수포자: 1, 2, 3, 4, 5 반복 (5회)
// 2번 수포자: 2, 1, 2, 3, 2, 4, 2, 5 반복 (8회)
// 3번 수포자: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5 반복 (10회)

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let first = [1, 2, 3, 4, 5]
    let second = [2, 1, 2, 3, 2, 4, 2, 5]
    let third = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    // 수포자 별 찍은 정답 배열 만들기
    func makeAnswer(_ target: [Int], _ time: Int) -> [Int] {
        let result = Array(repeating: target, count: time / target.count).flatMap{$0}
        let endIndex = target.index(target.startIndex, offsetBy: time % target.count)
        
        return result + target[0..<endIndex]
    }
    
    let firstAnswer = makeAnswer(first, answers.count)
    let secondAnswer = makeAnswer(second, answers.count)
    let thirdAnswer = makeAnswer(third, answers.count)
    
    var maxCount = 0                // 가장 높은 점수
    var countArray: [Int] = []      // 수포자별 점수
    for i in [firstAnswer, secondAnswer, thirdAnswer] {
        let iCount = i.enumerated().filter{$0.1 == answers[$0.0]}.count
        countArray.append(iCount)
        maxCount = maxCount > iCount ? maxCount : iCount
    }
    
    // 수포자 중 가장 높은 점수를 획득한 사람
    return countArray.enumerated().filter{$0.1 == maxCount}.map{$0.0 + 1}
}
