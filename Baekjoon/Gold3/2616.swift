// 2616 - 소형기관차
// dp[i] = i번째 기차까지 확인했을 때 최대값?

// 소형기관차가 끌 수 있는 최댓값 = 50000/3 = 19999


// dp[i][j]: i는 사용한 기관차 수, j는 확인한 칸수
import Foundation

let train = Int(readLine()!)!
let people = readLine()!.split(separator: " ").map{Int(String($0))!}  // 주어진 사람 수
let little = Int(readLine()!)!                                        // 소형기관차가 끌 수 있는 연속 기관차 수
var dp = Array(repeating: Array(repeating: 0, count: people.count+1), count: 4)
var arr = Array(repeating: 0, count: people.count+1)

// 사람의 누적합 수 구함
arr[1] = people[0]
for i in 2..<arr.count {
    arr[i] = arr[i-1] + people[i-1]
}

for i in 1...3 {
    for j in little*i...people.count {      // 2칸을 이끄는 경우 1칸만 보았을 땐 끌 수 없기 때문
        // i개로 j칸까지 보았을 때 최댓값 = max(이전칸까지 보았을 때 최댓값, little 전칸까지 보았을 때 최댓값 + little만큼의 수)
        dp[i][j] = max(dp[i][j-1], dp[i-1][j-little] + arr[j]-arr[j-little])
    }
}

print(dp[3][train])
