func solution(_ msg:String) -> [Int] {
    // 알파벳: 인덱스 사전
    var dict = [String: Int]()
    (1...26).forEach {
        dict[String(UnicodeScalar($0+64)!)] = $0
    }
    
    var answer = [Int]()
    var key = ""
    for i in msg {
        let newKey = key + String(i)            // 이전 문자열 + 새로운 문자 더함
        
        if dict[newKey] != nil {                // 새 문자열이 사전에 있다면
            key.append(String(i))               // 이전 문자열에 새 문자 더함
        } else {
            dict[newKey] = dict.count + 1       // 사전에 없는 경우 사전에 추가
            answer.append(dict[key]!)           // 이전 값을 정답에 넣기
            key = String(i)                     // 키 값을 현재 문자로 초기화
        }
    }
    
    answer.append(dict[key]!)                   // 마지막 문자 추가
    
    return answer
}
