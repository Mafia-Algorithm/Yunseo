// 2470 - 두 용액(1초, 추가시간 없음, 128MB) -> 브루트포스? 안될 듯.. -> 이분탐색

import Foundation

let count = Int(readLine()!)!
var number: [Int] = []
number = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)

var left = 0
var right = count - 1

var temp = number[right] + number[left]
var answer: [Int] = [left, right]                   // 정답을 저장할 변수

while left < right {
    let mix = number[right] + number[left]          // 두 용액 혼합
    
    if abs(temp) >= abs(mix) {                      // 기존 값보다 0에 가까운 경우
        answer[0] = left                            // 정답 업데이트
        answer[1] = right
        temp = mix
    }
    
    if mix < 0 {                                    // 혼합물이 음수인 경우(더 커져야 함, left 증가)
        left += 1
    } else if mix > 0 {                             // 혼합물이 양수인 경우(더 작아져야 함, right 감소)
        right -= 1
    } else {                                        // 0인 경우 멈춤
        break
    }
}

print(number[answer[0]], number[answer[1]])

