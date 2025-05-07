// 17298 - 오큰수
// 놓치기 쉬운 반례: 5 3 1 2 4

import Foundation

let N = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}  // 입력 배열
var answer: [Int] = Array(repeating: -1, count: N)                  // 정답 배열(오큰수가 없는 경우 -1)
var temp: [Int] = [nums[0]]                                         // 오큰수를 찾는데 필요한 배열

for i in 1..<N {
    var j = 1
    while !temp.isEmpty {               // temp가 비어있는 동안
        if temp.last! < nums[i] {       // temp의 마지막 숫자가 현재 숫자보다 작은 경우
            while answer[i-j] != -1 {   // ⭐️ 이미 오큰수가 결정된 경우는 넘어가야함.
                j += 1
            }
            answer[i-j] = nums[i]       // answer의 오큰수 업데이트
            temp.popLast()              // 사용된 숫자는 pop
            j += 1                      // temp의 다음숫자 역시 작은 경우를 대비해 j += 1
        } else { break }                // temp의 마지막 숫자가 현재 숫자보다 큰 경우 break
    }
    temp.append(nums[i])                // i번째 숫자가 오큰수인 경우를 모두 찾은 후 temp에 추가
}

print(answer.map{String($0)}.joined(separator: " "))

