// 1. 빈칸 기준으로 나눠서 첫글자만 대문자로 ?
// 2. 재구성할 때 공백 유의 ex) "  For the  last weak"가 올 수 있음

/// 문자열 + 연결 연산 가능
/// first! -> Character, dropFirst() -> Substring이지만 
/// uppercased(), lowercased()가 String 타입을 반환하기 때문에 + 연산 가능

func solution(_ s:String) -> String {
    var answer = ""
    var splitStr = s.split(separator: " ").map{
        $0.first!.uppercased() + $0.dropFirst().lowercased()
    }
    
    var index = 0
    var flag = true             // 공백 다음에 오는 문자만 append할 수 있도록 함
    
    s.forEach {
        if $0 == " " {          // 공백인 경우 유지
            answer.append($0)
            flag = true
        } else {                // 공백이 아니고
            if flag {           // 문자의 첫 등장인 경우
                answer.append(splitStr[index])
                flag = false    
                index += 1
            }
        }
    }

    return answer
}
