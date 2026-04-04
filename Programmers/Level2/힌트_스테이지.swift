import Foundation

func solution(_ cost:[[Int]], _ hint:[[Int]]) -> Int {
    let testcase = 1 << cost.count
    var answer = Int.max        // 최소 비용
    for i in 0..<testcase {     // 힌트권 구매 경우의 수
        
        var temp = 0    // 해당 케이스에서 사용하는 비용
        var count = Array(repeating: 0, count: cost.count) // count[i]: i라운드의 힌트권 수
        
        for round in 0..<cost.count {
            temp += cost[round][count[round]]
            
            // 마지막 라운드가 아니고 힌트를 구매하는 경우
            if (i >> round) & 1 == 1 && round != cost.count - 1 {
                temp += hint[round][0]
                for h in hint[round][1...] {
                    // 스테이지 해결비용은 최대 n개 힌트권을 사용한 경우까지만 제공하기 때문에 예외처리 필요
                    if count[h-1] < cost.count - 1 {
                        count[h-1] += 1
                    }
                }
            }
        }
        
        if answer > temp { answer = temp }
    }
    
    return answer
}
