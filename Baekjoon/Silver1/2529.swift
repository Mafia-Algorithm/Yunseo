// 2529 - 부등호

import Foundation

let count = Int(readLine()!)!       // count + 1은 개수
let info = readLine()!.split(separator: " ").map{String($0)}
var visit = Array(repeating: false, count: 10)          // 숫자 사용 여부
var answer = [String]()              // 구한 수열 리스트

func permitation(_ index: Int, _ now: String, _ signIndex: Int) {
    if now.count == count + 1 {         // 개수가 다 찼다면
        answer.append(now)
        return
    }
    
    if signIndex >= info.count || index >= 10 { return }        // 부등호를 모두 사용하고 숫자가 10보다 큰 경우
    
    if info[signIndex] == "<" {         // 다음에 현재 수보다 큰 수가 나와야 함
        for i in index...9 {
            if !visit[i] {              // 해당 숫자 사용한 적 없다면
                visit[i] = true
                permitation(i, now + "\(i)", signIndex + 1)     // 현재 숫자를 다음의 기준점으로 넘김
                visit[i] = false
            }
        }
    } else if info[signIndex] == ">" {      // 다음에 현재 수보다 작은 수가 나와야 함
        for i in 0...index {
            if !visit[i] {
                visit[i] = true
                permitation(i, now + "\(i)", signIndex + 1)
                visit[i] = false
            }
        }
    }
}

for i in 0...9 {            // 시작하는 수가 0~9
    visit[i] = true
    permitation(i, "\(i)", 0)
    visit[i] = false
}

print(answer.last!)
print(answer[0])


