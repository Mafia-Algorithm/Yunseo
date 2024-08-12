import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var picks = picks
    // 피로도 정보
    var fiveMinerals = [[String]]()
    
    /// 1. 다섯개씩 광물 끊기
    var m = 0
    while m < minerals.count {
        if m + 5 < minerals.count {
            fiveMinerals.append((m..<m+5).map{minerals[$0]})
        } else {
            fiveMinerals.append((m..<minerals.count).map{minerals[$0]})
        }
        m += 5
    }
    
    /// 2. 곡괭이 개수 == 다섯개씩 끊은 광물 덩어리 개수 일 때까지 pop
    let picksCount = picks.reduce(0, +)
    while picksCount < fiveMinerals.count {
        fiveMinerals.popLast()
    }
    
    var fatigue = [Int:Int]()
    for i in 0..<fiveMinerals.count {
        fatigue[i] = 0
        for m in fiveMinerals[i] {
            if m == "diamond" {
                fatigue[i]! += 25
            } else if m == "iron" {
                fatigue[i]! += 5
            } else {
                fatigue[i]! += 1
            }
        }
    }
    
    let fatigueDict = fatigue.sorted(by: {
        $0.1 > $1.1
    })
    
    var result = 0
    for f in fatigueDict {
        if picks[0] != 0 {
            picks[0] -= 1
            result += fiveMinerals[f.key].count
        } else if picks[1] != 0 {
            picks[1] -= 1
            for fiveMineral in fiveMinerals[f.key] {
                if fiveMineral == "diamond" {
                    result += 5
                } else {
                    result += 1
                }
            }
        } else {
            result += f.value
        }
    }
    
    return result
}
