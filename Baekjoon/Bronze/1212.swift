// 1212 - 8진수 2진수

import Foundation

 /// input의 입력 길이가 333,334까지 갈 수 있기 때문에 입력 받은 수를 바로 10진수 변환 후 2진수로 변환하면 강제 언래핑 오류 발생
/// 문자열로 입력 받아서 하나씩 2진수로 변환해주어야 함.
let oct = readLine()!.map{String($0)}
var result = String(Int(oct.first!)!, radix: 2)     // 첫번째 수 십진법으로 변환
for i in 1..<oct.count {                                // 이후로는 세 자리수 이진수여야 하기 때문에 따로 관리
    let binary = String(Int(oct[i])!, radix: 2)
    result.append(String(format: "%03d", Int(binary)!))
}
print(result)
