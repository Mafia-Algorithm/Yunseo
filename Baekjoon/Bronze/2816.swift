// 2816 - 디지털 티비

import Foundation

let N = Int(readLine()!)!

// 채널 입력
var channel: [String] = []
for _ in 0..<N {
    channel.append(readLine()!)
}


// ["A", "B", "KBS1", "KBS2"] 일때는 KBS1이 변경되어도 문제 없음
// ["A", "B", "KBS2", "KBS1"] 일때는 ["KBS1", "A", "B", "KBS2"]이 되어 인덱스를 변경해주어야 함.
var answer = ""
let kbs1 = channel.firstIndex(of: "KBS1")!
var kbs2 = channel.firstIndex(of: "KBS2")!

answer.append(String(repeating: "1", count: kbs1))
answer.append(String(repeating: "4", count: kbs1))

if kbs1 < kbs2 {
    kbs2 += 1
}

answer.append(String(repeating: "1", count: kbs2))
answer.append(String(repeating: "4", count: kbs2 - 1))          // kbs2 채널은 2번째 와야하므로 -1만큼만 눌러주어야 함.

print(answer)

