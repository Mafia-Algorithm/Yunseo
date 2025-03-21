// 원형으로 연결된 스티커에서 몇 장을 뜯어내 스티커에 적힌 숫자의 합이 최대가 되도록
// 한 장 뜯으면 양쪽 두 장도 같이 뜯어짐
// 최대값 return

// sticker <= 10만

import Foundation

func solution(_ sticker:[Int]) -> Int{
    var answer = 0
    var dp = Array(repeating: 0, count: sticker.count)
    
    // case 0. 스티커 3개 이하인 경우
    if sticker.count <= 3 {
        return sticker.max()!
    }
    
    // case 1. 첫번째 스티커 뜯기
    dp[0] = sticker[0]
    dp[1] = dp[0]
    for i in 2..<sticker.count-1 {              // 마지막 스티커 사용 불가
        dp[i] = max(dp[i-2] + sticker[i], dp[i-1])
    }
    answer = dp[sticker.count-2]                // 마지막 스티커 사용 불가
    
    // case 2. 두번째 스티커 뜯기
    dp = Array(repeating: 0, count: sticker.count)
    dp[0] = 0
    dp[1] = sticker[1]
    for i in 2..<sticker.count {
        dp[i] = max(dp[i-2] + sticker[i], dp[i-1])
    }
    answer = max(answer, dp.last!)
    
    return answer
}
