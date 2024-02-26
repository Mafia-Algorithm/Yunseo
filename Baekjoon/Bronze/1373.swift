// 1373 - 2진수 8진수

import Foundation

var input = readLine()!.reversed().map{String($0)}

// 길이가 3으로 딱 나누어 떨어지지 않는다면
if input.count % 3 > 0 {
    input.append(contentsOf: Array(repeating: "0", count: 3 - input.count % 3))
}

var result = ""
for i in stride(from: 0, to: input.count-1, by: 3) {
    let temp = input[i+2] + input[i+1] + input[i]
    result.append(String(Int(temp, radix: 2)!))
}

print(String(result.reversed()))
