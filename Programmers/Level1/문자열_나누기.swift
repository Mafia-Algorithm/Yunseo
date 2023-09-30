import Foundation

func solution(_ s:String) -> Int {
    var s = s.map{String($0)}  // 문자열 배열로 변경
    var result = 0
    var index = 0
    
    while index < s.count {   // 문자열 순회
        let x = s[index]      // 지금 확인할 첫번째 글자
        var xCount = 1
        var otherCount = 0    // x와 다른 알파벳의 개수
        if index + 1 == s.count {  // index가 마지막 알파벳이었다면
            result += 1       // 1개의 경우 결과에 +1
            break
        }
        for char in index+1..<s.count {     // x의 다음 문자열부터 끝까지 확인
            if s[char] == x {               // 현재 문자열이 x와 같으면 xCount + 1
                xCount += 1
            } else {
                otherCount += 1             // 그게 아니라면 otherCount + 1
            }
            if xCount == otherCount {       // 지금까지 나온 x와 other의 개수가 같을 시
                result += 1                 // 결과 + 1
                index = char + 1            // index는 현재 알파벳 다음으로 변경
                break
            }
            index = char                    // x와 다른 알파벳의 개수가 같아지지 않는 경우 index를 지금까지 읽은 알파벳으로 설정
            if index == s.count {
                result += 1
            }
        }
    }
    
    return result
}
