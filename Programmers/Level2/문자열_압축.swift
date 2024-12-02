import Foundation

// 1개 이상의 단위로 잘라서 압축
// aabbaccc -> 2a2ba3c
// 문자열을 1개부터 n개까지 자르기
func solution(_ s:String) -> Int {
    var answerList: [String] = []
    
    func splitStr(_ size: Int) -> String {
        var remainStr = s
        var answer = ""
        var target = String(remainStr[remainStr.startIndex..<remainStr.index(remainStr.startIndex, offsetBy: size)])
        var count = 1
        
        // 남은 문자열을 자를 수 있을 때까지
        while remainStr.count >= size {
            /// 앞에서 size만큼 자른 문자열
            let targetStr = String(remainStr[remainStr.startIndex..<remainStr.index(remainStr.startIndex, offsetBy: size)])
            /// 남은 문자열
            remainStr = String(remainStr[remainStr.index(remainStr.startIndex, offsetBy: size)...])
        
            /// 앞에서 size만큼의 문자열 == 자른 문자열
            if remainStr.prefix(size) == targetStr {
                count += 1
            } else {    /// 같지 않은 경우
                if count != 1 {
                    answer.append("\(count)")
                }
                answer.append("\(targetStr)")
                count = 1
            }
        }
        
        /// 남은 문자열 붙이기
        if remainStr.count != 0 {
            answer.append(remainStr)
        }
        
        return answer
    }
    
    /// 1 ~ N개 단위로 쪼개기
    for i in 1...s.count {
        answerList.append(splitStr(i))
    }
    
    return answerList.sorted{ $0.count < $1.count }[0].count
}
