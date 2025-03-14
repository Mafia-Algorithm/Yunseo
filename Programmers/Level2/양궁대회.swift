// 브루트포스

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var ryan: [Int] = []
    var arrow = n
    var candidate: [[Int]] = []

    func dfs(_ count: Int, _ score: inout [Int], _ remain: inout Int) {
        if score.count == 11 {              // 라이언의 점수판이 완성되고 라이언이 승리하는 경우만 추출
            let diff = getScoreDiff(score, info)
            if diff != 0 {                  // 라이언이 이긴 경우
                candidate.append(score + [diff])
            }
            return
        }
        
        for i in 0...n {                    // 0개부터 n개까지 활 쏘기 가능
            if i > remain {                 // 남는 화살이 없다면 쏘지 않음
                continue
            } else {
                score.append(i)             // 남는 화살이 있는 경우 활 쏘기
                remain -= i
                dfs(count+1, &score, &remain)
            }
            remain += score.removeLast()    // 다시 뽑은 화살만큼 더해주기
            
        }
    }
    
    func getScoreDiff(_ ryan: [Int], _ apeach: [Int]) -> Int {
        if ryan.reduce(0, +) != n { return 0 }            // 라이언이 쏜 화살의 개수도 n개여야 함
        var rScore = 0
        var aScore = 0
        
        for i in 0..<11 {
            if ryan[i] == 0 && apeach[i] == 0 {               // 둘 다 획득하지 못하는 경우
                continue
            }
            if ryan[i] > apeach[i] {                          // 라이언이 획득하는 경우
                rScore += (10-i)
            } else {                                          // 어피치가 획득하는 경우
                aScore += (10-i)
            }
        }

        return rScore > aScore ? rScore - aScore : 0           // 라이언이 이긴 경우 두 점수 차 반환
    }
    
    dfs(0, &ryan, &arrow)
    
    // 점수 차가 가장 큰 순 -> 작은 점수를 많이 맞춘 순
    candidate.sort{
        if $0.last! == $1.last! {                               // 점수 차가 같은 경우
            for i in (0..<11).reversed() {                      // 역순으로 비교하여 더 많이 쏜 경우를 우선 정렬
                if $0[i] != $1[i] { return $0[i] > $1[i] }
            }
        }
        return $0.last! > $1.last!                              // 점수차가 큰 순으로 정렬
    }
    
    return candidate.isEmpty ? [-1] : candidate[0].dropLast(1)
}
