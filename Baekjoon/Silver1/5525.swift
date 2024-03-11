// 5525 - IOIOI

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
let S = readLine()!.map{String($0)}         // 입력받은 문자열

let IOI = "IOI".map{String($0)}

var answer = 0                              // 정답
var index = 0                               // 배열 index
var count = 0

while index <= S.count - 3 {
    if Array(S[index...index+2]) == IOI {
        count += 1
        index += 1
        if count == N {             // IOI가 나온 횟수가 같다면
            answer += 1             // 정답 + 1
            count -= 1              // 0이 아닌 이유: IOIOI가 됐을 때 앞에 IOI만 제거하고 뒤에 나온 IOI 재사용
        }
    } else {
        count = 0
    }
    index += 1
}

print(answer)

