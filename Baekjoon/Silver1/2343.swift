// 2343 - 기타레슨
// 매개변수 탐색

// 강의 순서 뒤바뀌면 안됨, 블루레이 수 1일 수 있음
// 100,000 * 10,000 = 1,000,000,000 -> 10억 == 10^10
// 2^10 = 10^3 -> 2^30 = 10^9,, Int64 가능

//start = 1
//end = 1000000000

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let M = input[1]
var lecture = readLine()!.split(separator: " ").map{Int(String($0))!}

var start = 1
var end = lecture.reduce(0, +)

while start < end {
    let mid = (start + end) / 2
    if check(mid) {             // 가능한 경우
        end = mid              // 더 작은 경우가 있을 수 있음 -> 범위의 최댓값을 mid로
    } else {                    // 불가능한 경우
        start = mid + 1         // 이 용량보다는 커야 함 -> 범위의 최솟값을 mid+1로
    }
}

// 블루레이 1개 분량이 target만큼일 때 M개에 담을 수 있는지 확인
func check(_ target: Int) -> Bool {
    var sum = 0
    var count = 0
    var index = 0
    
    while index < lecture.count {
        if sum + lecture[index] > target {          // 현재 강의를 더했을 때 블루레이에 담을 수 없다면
            if lecture[index] > target { return false }     // ⭐️또는 현재 강의 자체가 블루레이 크기보다 크다면 -> 시간초과 원인⭐️
            count += 1                                  // 블루레이 개수 + 1
            sum = 0                                     // 담는 강의 초기화, 해당 index 강의는 넣지 않았으므로 index 변화 없음
        } else {
            sum += lecture[index]                   // 담기
            index += 1
        }
    }
    
    if count + 1 <= M {         // count(블루레이에 꽉 차게 넣은 경우) + 1 (남은 자투리 강의)
        return true
    }
    return false
}

print(start)

