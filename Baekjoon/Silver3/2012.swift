// 2012 - 등수 매기기

// 1 ~ N까지 동석차 없이 등수를 매겨야 함.
// A등수로 예상했는데 실제 등수가 B인 경우 -> 불만도: |A-B|
// 학생들의 불만도를 최소로 하는 등수

// 학생 수 최대 50만, 2초 -> O(N^2)은 안됨

import Foundation

let N = Int(readLine()!)!
var expect: [Int] = []

for _ in 0..<N {
    expect.append(Int(readLine()!)!)
}

expect = expect.sorted{$0 < $1}

var answer = 0
for i in 1...N {
    answer += abs(expect[i-1] - i)
}

print(answer)
