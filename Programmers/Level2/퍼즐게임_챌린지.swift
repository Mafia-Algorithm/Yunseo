import Foundation

// diff: 각 퍼즐의 난이도
// time_cur: 현재 퍼즐 소요 시간
// time_pre: 이전 퍼즐 소요 시간
// level: 숙련도

// 1. diff <= level인지 확인
// 1-1. diff <= level인 경우 time_cur만큼 사용
// 1-2. diff > level인 경우 (diff-level) * (time_cur + time_prev) + time_cur
// 제한시간 안에 모든 퍼즐을 해결해야 함
// 2. 만약 limit을 넘은 경우 숙련도 높이기
// 2-1. 만약 limit을 넘지 않는 경우 숙련도 낮추기

// 퍼즐 30만회
// 한 퍼즐의 최대 난이도 10만
// 한 퍼즐의 최대 소요 시간 1만초
// 전체 소요 시간 10^15

// O(NlogN)
func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    var left = diffs.min()!
    var right = diffs.max()!
    var level = (left + right) / 2      // 숙련도
    var isSolve = true
    
    while left <= right {               // 더 이상 탐색할 수 없을때까지
        isSolve = true
        level = (left + right) / 2
        
        // 걸리는 시간 확인
        var fullTime = times[0]
        for (i, puzzle) in diffs.enumerated() {
            if i == 0 { continue }           // 첫번째 퍼즐인 경우 skip
            
            // i번째 퍼즐 푸는데 걸리는 시간
            if puzzle <= level {
                fullTime += times[i]
            } else {
                fullTime += ((puzzle-level) * (times[i] + times[i-1]) + times[i])
            }
            
            // 전체 제한시간 넘으면 뒷 퍼즐은 보지 않음
            if fullTime > limit {
                isSolve = false
                break
            }
        }
        
        if !isSolve {           // 풀 수 없는 경우
            left = level + 1    // 숙련도 상승
        } else {                // 풀 수 있는 경우
            right = level - 1   // 최댓값을 현재 숙련도로 유지
        }
    }
    
    return left                 // 최솟값이기 때문에 left
}
