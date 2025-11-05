// 1092 - 배(2초, 128MB)
// 크레인 N대, 1분에 박스 하나씩 실을 수 있음
// 모든 크레인은 동시에 움직임

// 크레인 무게 제한, 무게 제한보다 무거운 박스는 크레인으로 옮길 수 없음
// 모든 박스를 배로 옮기는 데 드는 시간의 최솟값 구하기

// N <= 50: 크레인 수
// 크레인 무게 제한 <= 1백만
// M <= 1만: 박스 개수

import Foundation

let N = Int(readLine()!)!
let crane = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted{ $0 > $1 }
let M = Int(readLine()!)!
var box = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted{ $0 > $1 }

if crane[0] < box[0] {
    print(-1)
    exit(0)
}

var time = 0
var boxCount = box.count
var visited = Array(repeating: false, count: M)

while boxCount > 0 {
    var index = 0                    // 크레인, 박스 공용 인덱스
    for i in 0..<N {                // 무게 큰 크레인부터
        while index < M {           // 박스 순회
            if !visited[index] && crane[i] >= box[index] {
                visited[index] = true
                boxCount -= 1
                index += 1
                break               // 크레인은 이 타임에 박스 들었음, 다음 크레인으로 이동
            }
            index += 1              // 들지 못하느 경우 다음 박스로 이동
        }
    }
    time += 1
}

print(time)

// 시간초과 첫번째 시도
while boxCount > 0 {
    // 크레인은 내림차순(무게 높은 순), 박스는 가벼운 순이기 때문
    if crane.first! < box.last! { break }    // 옮길 수 없는 박스가 있다면 종료
    for i in 0..<crane.count {      // 크레인(무게 높은 순)
        let weight = crane[i]       // 크레인 최대 무게
        for i in 0..<box.count {    // 남은 박스 순회
            if box[box.count - i - 1] <= weight {    // 들 수 있는 박스가 등장하면 옮기기
                box.removeLast()
                boxCount -= 1
                break
            }
        }
    }
    time += 1
}

-> 크레인 하나가 박스를 옮긴 뒤 그 다음 크레인도 처음부터 박스 배열을 훑음, 1초에 박스 크레인 개수만큼 순회
-> 정답 코드는 이전 크레인이 훑은 그 다음 박스부터보기 때문에 1초에 박스 1회 순회

