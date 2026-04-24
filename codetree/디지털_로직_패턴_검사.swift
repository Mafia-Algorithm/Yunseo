// 0, 1로 구성
// k 이상의 동일한 패턴이 m번 이상 반복되면 불안정한 로직
// k: 패턴 최소 길이, m: 감지 횟수, s: 디지털 로직 (백만 이하)

import Foundation

let digitalLogic = readLine()!.map{String($0)}
let tokens = readLine()!.split(separator: " ")
let k = Int(tokens[0])!
let m = Int(tokens[1])!

// Please write your code here.
// 슬라이딩 윈도우
// 편안한 등산로와 마찬가지로 k 이상일 때의 횟수를 구하려면 k일때만 구해도 됨.
// k이상 == k일 때의 경우를 포함하기 때문

var count: [Int: Int] = [:]
var isStable = true

// 문자열을 계속 새로 구성하면(subscript로) O(n)의 시간이 걸림.
// n=100만, k가 크면 String(chars[i..<i+k])가 O(k)라서 전체 O(n*k) → 최악 6천만
var pattern = Int(digitalLogic[0..<k].joined(), radix: 2)!
var target = 1
for _ in 0..<k-1 {
    target *= 2
}

count[pattern, default: 0] += 1
for i in 0..<(digitalLogic.count - k) {      // 시작 인덱스는 n-k 여야 오류나지 않음
    // i번째 값 제거 후 shift 연산, 이후 새로운 값 추가
    pattern = (pattern - Int(digitalLogic[i])! * target) * 2 + Int(digitalLogic[i+k])!
    count[pattern, default: 0] += 1

    if count[pattern]! >= m {
        isStable = false
        break
    }
}

print(isStable ? 0 : 1)
