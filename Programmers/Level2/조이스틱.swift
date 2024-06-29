/// 조이스틱
/// A = 65, Z = 91

import Foundation

func solution(_ name:String) -> Int {
    let name = name.map({$0})
    var alphaCount = 0
    for i in 0..<name.count {
        if name[i] != "A" {
            let up = name[i].asciiValue! - 65
            let down = 91 - name[i].asciiValue!
            alphaCount += Int((up<down) ? up : down)
        }
    }
    
    var minMove = name.count-1                  /// 좌우로 움직이는 최소 횟수
    for i in 0..<name.count {
        if name[i] != "A" {
            var next = i + 1
            while next<name.count && name[next] == "A" {
                next += 1
            }
            let move = 2 *  i + name.count - next
            minMove = min(move, minMove)
        }
    }
    return alphaCount + minMove
}

