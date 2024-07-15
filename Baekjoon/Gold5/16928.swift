// 16928 - 뱀과 사다리 게임

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let ladder = input[0], snake = input[1]
var counting = Array(repeating: Int.max, count: 101)         // i번째 구간까지 가는데 걸린 횟수
var visit = Array(repeating: false, count: 101)             // 방문 처리
var info = Array(repeating: 0, count: 101)                  // 사다리 또는 뱀의 정보

/// ⭐️시작 위치는 주사위를 던지지 않음!
counting[0] = 0
counting[1] = 0

/// 사다리와 뱀 정보 저장
for _ in 0..<ladder {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    info[temp[0]] = temp[1]
}

for _ in 0..<snake {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    info[temp[0]] = temp[1]
}


func bfs(_ start: Int = 1) {
    var queue: [Int] = [start]
    var index = 0
    
    while index < queue.count {
        let now = queue[index]
        
        /// 100번에 도달한 경우 종료
        if now == 100 {
            break
        }
        
        /// 주사위 1~6만큼 굴리기
        for i in 1...6 {
            let next = now + i
            
            /// 범위 내에 있고 방문한 적이 없다면
            if 1...100 ~= next && !visit[next] {
                /// 도달한 위치의 횟수 업데이트
                counting[next] = min(counting[next], counting[now] + 1)
                
                /// 만약 사다리 또는 뱀이 있는 경우
                if info[next] != 0 {
                    counting[info[next]] = min(counting[info[next]], counting[next])
                    queue.append(info[next])                    /// 사다리 또는 뱀을 타고 바로 이동
                    visit[info[next]] = true
                } else {                                        /// 사다리 또는 뱀이 없는 경우
                    queue.append(next)
                    visit[next] = true
                }
            }
        }
        
        index += 1
    }
}

bfs()
print(counting[100])

/// DP 방식 ->  사이클 생성되기 때문에 DP로 풀이 불가
//let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//let ladder = input[0], snake = input[1]
//var counting = Array(repeating: Int.max, count: 101)         // i번째 구간까지 가는데 걸린 횟수
//var info = Array(repeating: 0, count: 101)          // 사다리 또는 뱀의 정보
//
//for i in 1...6 {
//    counting[i] = 1
//}
//
///// 사다리 정보 입력
//for _ in 0..<ladder {
//    let l = readLine()!.split(separator: " ").map{Int(String($0))!}
//    info[l[0]] = l[1]
//}
//
///// 뱀 정보 입력
//for _ in 0..<snake {
//    let s = readLine()!.split(separator: " ").map{Int(String($0))!}
//    info[s[0]] = s[1]
//}
//
//for i in 1...100 {
//    for j in 1...6 {
//        if info[i] != 0 {
//            counting[info[i]] = min(counting[info[i]], counting[i])
//        }
//        if i-j <= 0 { continue }
//        counting[i] = min(counting[i], counting[i-j] + 1)
//        
//    }
//}
//
//print(counting)
//print(counting[100])

