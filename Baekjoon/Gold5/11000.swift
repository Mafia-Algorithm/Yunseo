import Foundation

let N = Int(readLine()!)!
var times: [(Int, Bool)] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    times.append((input[0], true))                  // 시작 시간
    times.append((input[1], false))                 // 끝나는 시간
}

times.sort {
    if $0.0 == $1.0 {           // 시간이 같은 경우
        return !$0.1            // 끝나는 경우를 앞으로
    }
    return $0.0 < $1.0          // 시간 순 정렬
}

var current = 0
var answer = 0                  // 사용하는 강의실 수
for i in 0..<times.count {
    if times[i].1 {             // 시작 시간인 경우 하나 추가
        current += 1
        answer = max(current, answer)
    } else {                    // 종료 시간인 경우 제외
        current -= 1
    }
}

print(answer)
