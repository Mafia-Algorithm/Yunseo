// dfs로도 정답은 나오지만 모든 경우의 수를 고려하지 않기 때문에 dp로 풀이 

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var dp = Array(repeating: Set<Int>(), count: 9)           // N을 i번 사용하여 만들 수 있는 모든 숫자를 저장
    dp[0].insert(0)                                           // 숫자 0개를 사용한 경우
    dp[1].insert(N)                                           // 숫자 1개를 사용한 경우
    
    //dp[5] = (dp[1] op dp[4]), (dp[2] op dp[3]), (dp[3] op dp[2]), (dp[4] op dp[1])이 될 수 있으므로 j활용
    for i in 2...8 {
        for j in 1...i {
            for num1 in dp[j] {
                for num2 in dp[i-j] {
                    dp[i].insert(num1 + num2)
                    dp[i].insert(num1 - num2)                 // -, / 연산은 연산자 순서에 따라 결과 달라짐
                    dp[i].insert(num2 - num1)
                    dp[i].insert(num1 * num2)
                    if num2 > 0 { dp[i].insert(num1 / num2) }
                    if num1 > 0 { dp[i].insert(num2 / num1) }
                }
            }
        }
        dp[i].insert(Int(String(repeating: String(N), count: i))!)      // i=3일 때 555만들 수 있음
    }
    
    var answer: [Int] = []
    for (i, v) in dp.enumerated() {
        if v.contains(number) { answer.append(i) }
    }
    
    return answer.isEmpty ? -1 : answer[0]
}
