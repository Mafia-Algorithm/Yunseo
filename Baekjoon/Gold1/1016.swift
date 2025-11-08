// 1016 - 제곱 ㄴㄴ수

// min ~ max 사이에 존재하는 제곱수가 아닌 수의 개수 구하기
// 1 <= min <= 1조
// min <= max <= min + 1백만

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let min = input[0]
let max = input[1]

var isPrime = Array(repeating: false, count: max - min + 1)         // min ~ max 구간만 확인

var i = 2
let maxLimit = Int(sqrt(Double(max)))
while i <= maxLimit {
    let square = i * i
    var start = ((min + square - 1) / square) * square              // 범위 내 i의 제곱수의 배수를 찾음
    while start <=  max {
        isPrime[Int(start - min)] = true
        start += square
    }
    i += 1
}

print(isPrime.filter{ !$0 }.count)


// 왜 start를 구할 때 (min + square - 1 / square)을 하는가?
// min이 square의 배수인 경우 min부터 시작
// min이 square의 배수가 아닌 경우 min보다 큰 제곱수의 배수부터 시작

// / square * square이면 생략할 수 있지 않나?
// Swift는 나머지를 버리는 나눗셈 방식이기 때문에 항상 결과가 같지 않을 수 있음
// floor((min + square - 1) / square)과 같음

// (10 + 4 - 1) != (10 + 4 - 1) / 4 * 4 = 13 != 12

