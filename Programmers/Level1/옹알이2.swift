import Foundation

// 연속해서 같은 발음 불가
// hasSuffix사용 또는 replacingOccurrences(of: with:)
func solution(_ babbling:[String]) -> Int {
    let list = ["aya", "ye", "woo", "ma"]
    var result = 0
    for b in babbling {
        var target = b
        for l in list {
            var targetString = l
            targetString = targetString.appending(l)
             if !target.contains(targetString) {          // 연속되는 발음이 없다면
                 target = target.replacingOccurrences(of: l, with: "*")
             }
        }
        
				// "*"이 아닌거(변환되지 않은 알파벳)의 개수가 0개가 아니면, 즉 남아 있는 알파벳이 존재한다면 넘어가기
        if target.filter({$0 != "*"}).count != 0 { continue }
        result += 1
    }
    
    return result
}
