import Foundation

// stages: 현재 도전중인 스테이지

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var fail = [Int: Double]() // 스테이지: 실패율
    var total = stages.count    // 전체 참가 인원
    var stage = Array(repeating: 0, count: N + 2)   // 참가자들의 단계
    
    // 각 스테이지에 몇 명이 있는지 저장
    for n in stages {
        stage[n] += 1
    }

    // 현재 스테이지 도전 중인 사람 / 현재 스테이지를 도전 중이거나 깬 사람
    for i in 1...N {
        if stage[i] == 0 {      // 예외처리를 안 해도 어차피 0을 나누는거니까 해주지 않아도 된다고 생각했는데, 5, [4, 4, 4, 4]의 경우 0을 0으로 나누게 되어 도달한 사람이 없을 때 0으로 처리해주는 과정이 반드시 필요
            fail[i] = 0
        } else {
            fail[i] = Double(stage[i]) / Double(total)
            total -= stage[i]                   // 이 단계에 있는 사람은 다음 단계 도전 X
        }
    }
    
    // 실패율 높은 순 - 스테이지 빠른 순으로 정렬
    let sortedFail = fail.sorted{
        if $0.1 == $1.1 {
            return $0.0 < $1.0
        }
        return $0.1 > $1.1
    }
    
    return sortedFail.map{$0.key}
}

print(solution(5, [4, 4, 4, 4, 4]))
