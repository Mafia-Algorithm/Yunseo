// 2565 - 전깃줄(1초, 128MB)

import Foundation

let line = Int(readLine()!)!                                // 전깃줄 개수
var dp = Array(repeating: 1, count: line)                   // i까지 확인했을 때 최대 전깃줄의 개수
var wire = Array(repeating: [Int](), count: line)           // 전깃줄 정보 저장

// 전깃줄 input 입력
for i in 0..<line {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    wire[i] = input
}

wire.sort{$0[0] < $1[0]}                                    // 전깃줄 시작 위치 오름차순 정렬
let array = wire.map{$0[1]}                                 // 전깃술 끝 부분 배열로 만들기

// LIS 부분
for i in 1..<line {                                         // i번째 줄까지 사용했을 때 최대 개수
    for j in 0...i {                                        // 첫번째 줄부터 i번째 줄까지 확인
        if array[i] > array[j] {                            // i번째 줄의 끝나는 위치 > 이전 줄의 끝나는 위치
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

// 줄의 개수가 아니라 지워야 하는 줄의 개수
// 이때 dp의 마지막이 아니라 최댓값을 빼야 함!!!
print(line - dp.max()!)

