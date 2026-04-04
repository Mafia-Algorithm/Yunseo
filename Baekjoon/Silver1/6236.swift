// 6236 - 용돈 관리

// M번만 통장에서 돈 뺄 수 있음
// K원 인출 -> 하루를 보낼 수 있다면 그대로 사용, 모자라면 남은 금액을 넣고 다시 K원 인출
// M을 맞추기 위해 남은 금액 > 그날 사용할 금액이어도 다시 통장에 넣고 K원 인출 가능
// 인출금액 K를 최소화하자
// K를 구하라

import Foundation

//5번만 통장에서 돈 뺄 수 있음
//1 100
//2 400
//3 300
//4 100
//5 500
//6 101
//7 400
//
//최소 금액 -> 기준이 있어야 함

// 남은 돈 < 다음 날 사용할 금액이면 넣고 재인출
// M번 이상이라면 -> 하루 인출할 금액 크기 인하

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var money: [Int] = []

for _ in 0..<input[0] {
    money.append(Int(readLine()!)!)
}

var left = money.max()!
var right = money.reduce(0, +)
var mid = (left + right) / 2
var answer = 0

while left <= right {
    mid = (left + right) / 2
    
    var count = 1               // 인출 횟수
    var output = mid              // 인출한 돈
    for i in 0..<money.count {
        if output < money[i] {  // 돈이 모자라면
            output = mid        // 다시 인출
            count += 1
        }
        output -= money[i]      // 사용
    }
    
    if count > input[1] {       // 인출 횟수가 M보다 크면 -> 기준 올리기
        left = mid + 1
    } else if count <= input[1] {  // 인출 횟수가 M보다 작으면 -> 기준 낮추기
        answer = mid
        right = mid - 1
    }
}

print(answer)

