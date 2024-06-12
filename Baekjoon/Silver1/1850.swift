// 1850 - 최대공약수
// 입력되는 수 2^63 보다 작으므로 Int형으로 풀 수 있음

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

func gcb(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    }
    return gcb(b, a%b)
}

print(String(repeating: "1", count: gcb(input[0], input[1])))
