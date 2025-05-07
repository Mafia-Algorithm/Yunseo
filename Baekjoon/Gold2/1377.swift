// 1377 - 버블 소트
// 버블 소트를 몇 번째에서 멈추어야 하는지 구하는 문제
// N <= 50만

import Foundation

let N = Int(readLine()!)!
var nums: [(Int, Int)] = []     // 입력 순서: 숫자

for i in 0..<N {
    nums.append((i, Int(readLine()!)!))
}

nums.sort { $0.1 < $1.1 }       // 숫자를 기준으로 정렬

var answer = 0
nums.enumerated().forEach {
    let move = $0.element.0 - $0.offset     // 각 숫자의 입력 위치 - 정렬된 위치를 구함
    answer = answer < move ? move : answer  // (버블 소트 횟수 = 입력 위치 - 정렬된 위치)이므로 최댓값은 버블 소트가 진행되는 횟수임
}
print(answer + 1)               // 문제에서 버블 소트가 필요없는 순간을 물어봤기 때문에 버블 소트의 횟수 + 1을 해주어야 함.
