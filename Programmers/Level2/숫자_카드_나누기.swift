// 1. arrayA의 최대공약수 구하기
// 2. arrayB를 나눠보기
// 1, 2가 모두 성공하면 정답

// 3. arrayB의 최대공약수 구하기
// 4. arrayA 나눠보기
// 1, 2가 모두 성공하면 정답

// 두 값 비교

import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    /// a / b = 몫, 나머지에서 나머지가 0일때까지 b / 나머지를 반복
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a % b == 0 { return b }
        return gcd(b, a % b)
    }
    
    var answerA = 0
    for a in arrayA {
        answerA = gcd(answerA, a)
    }
    
    var answerB = 0
    for b in arrayB {
        answerB = gcd(answerB, b)
    }
    
    if answerA == 1 || arrayB.filter{$0 % answerA == 0 }.count != 0 {
        answerA = 0
    }
    
    if answerB == 1 || arrayA.filter{$0 % answerB == 0 }.count != 0 {
        answerB = 0
    }
    
    return max(answerA, answerB)
}
