
/// 11399 - ATM
/// 1. 걸리는 시간 순서대로 정렬
/// 2. 누적합 구함. Pi는 정렬 순으로 i번 반복해서 더해짐에 따라 수식 작성

import Foundation

let N = Int(readLine()!)!
var time = readLine()!.split(separator: " ").map{Int(String($0))!}

time.sort(by: <)

var result = 0
for i in 0..<time.count {
    result +=  (time.count-i) * time[i]
}

print(result)

