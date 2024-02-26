
// 2745 - 진법 변환
/// 어떤 수를 십진수로 변환할 때는 Int(value, radix: )를 사용
import Foundation

let input = readLine()!.split(separator: " ").map{String($0)}
let radix = Int(input[1])!

print(Int(input[0], radix: radix)!)

