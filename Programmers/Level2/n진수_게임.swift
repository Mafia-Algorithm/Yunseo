// t: 미리 구할 숫자 갯수, m: 게임에 참가하는 인원
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var answer = ""
    var numberStr: [String] = []

    // 최대 t*m개의 문자열만 필요
    for i in 0..<t*m {
        let radixNum = String(i, radix: n).map{String($0).uppercased()}
        numberStr.append(contentsOf: radixNum)
        
        if numberStr.count > t * m {
            break
        }
    }
    
    // m 배수에 나머지가 p-1인 인덱스의 문자열만 추출
    (0..<t).forEach {
        answer.append(numberStr[$0 * m + p - 1])
    }
    
    return answer
}
