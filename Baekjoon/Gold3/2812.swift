// 2812 - 크게 만들기(1초, 128MB)

// N자리 숫자가 주어졌을 때, 숫자 K개를 지워서 얻을 수 있는 가장 큰 수
// 1 <= K < N <= 50만
// N은 0으로 시작하지 않음

// 프로그래머스 lv2 큰 수 만들기랑 동일한 문제

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]

var number = readLine()!.map{Int(String($0))!}
var answer: [Int] = []

var deleteCount = 0
var i = 0
while i < n {
    if answer.isEmpty || answer.last! >= number[i] || deleteCount == k {
        answer.append(number[i])
    } else {
        // 현재 숫자보다 작은 숫자는 다 지움 -> 앞 숫자가 가장 커야 함(그리디)
        while !answer.isEmpty && answer.last! < number[i] && deleteCount < k {
            answer.removeLast()
            deleteCount += 1
        }
        answer.append(number[i])
    }
    i += 1
}

// 끝까지 순회하지 않았는데 숫자를 다 지운 경우, 뒤에 남은 숫자 덧붙이기
if i < n {
    answer.append(contentsOf: number[i...])
} else if deleteCount < k {     // ⭐️ 놓친 케이스)모두 순회했는데 다 지우지 못한 경우
    answer = Array(answer[0..<(n-k)])
}

print(answer.map{String($0)}.joined())

