//  1389 - 케빈 베이컨의 6단계 법칙

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let user = input[0]
let relation = input[1]
var friend = [Int: [Int]]()
for i in 1...user {
    friend[i] = []
}

// 연결된 노드 정보
for _ in 0..<relation {
    let info = readLine()!.split(separator: " ").map{Int(String($0))!}
    friend[info[0]]?.append(info[1])
    friend[info[1]]?.append(info[0])
}

// 방문 정보 초기화
var answer = [Int]()
var visit = Array(repeating: false, count: user)
for i in 1...user {
    visit = Array(repeating: false, count: user)
    answer.append(kevinBacon(i))
}

func kevinBacon(_ start: Int) -> Int {
    var kevin = 0
    visit[start-1] = true
    
    var queue: [([Int], Int)] = [(friend[start]!, 1)]
    
    while !queue.isEmpty {
        let now = queue.removeFirst()

        for n in now.0 {
            if !visit[n-1] {
                visit[n-1] = true           // 친구 확인
                kevin += now.1                  // 케빈 베이컨 수 추가
                queue.append((friend[n]!, now.1 + 1))
            }
        }
    }
    return kevin
}

print(answer.enumerated().filter{$0.element == answer.min()}[0].offset + 1)

