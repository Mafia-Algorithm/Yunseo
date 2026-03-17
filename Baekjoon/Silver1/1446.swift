// 1446 - 지름길
// N <= 12, D <= 10000

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], d = input[1]

var time = Array(repeating: 0, count: 10001)
for i in 0...10000 {
    time[i] = i
}

/// shortcuts[start] = (end, time)
var shortcuts = Array(repeating: [(Int, Int)](), count: d + 1)

for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = info[0], end = info[1], shortTime = info[2]
    
    // end > d는 고려할 필요 없음.
    // 만약 start > d인 경우가 들어온다면 shortcuts의 크기가 d이므로 런타임 에러 발생 -> 역주행이 안되기 때문에 end로 사전 차단
    if start > end || (end - start) < shortTime || end > d { continue }
    shortcuts[start].append((end, shortTime))
}

for i in 0...d {
    // 직전 칸에서 출발 vs 기존 시간
    if i > 0 {
        time[i] = min(time[i - 1] + 1, time[i])
    }
    
    // i에서 출발하는 지름길 적용
    for j in 0..<shortcuts[i].count {
        let info = shortcuts[i][j]
        let start = i, end = info.0, shortTime = info.1
        // 직전 칸과 비교하는 것은 위에서 하기 때문에 여기서는 최단 지름길만 업데이트
        time[end] = min(time[end], time[start] + shortTime)
    }
}

print(time[d])
