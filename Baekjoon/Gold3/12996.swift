// 12996 - Acka(2초, 512MB)

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let music = input[0]
let p1 = input[1], p2 = input[2], p3 = input[3]

var dp = Array(repeating: Array(repeating: Array(repeating: Array(repeating: -1 , count: 51), count: 51), count: 51), count: 51)

var answer = 0
func calculate(_ musicCount: Int, _ p1Count: Int, _ p2Count: Int, _ p3Count: Int) -> Int {
    // 모두 녹음해도 불가능한 경우
    if p1Count + p2Count + p3Count < musicCount {
        return 0
    }
    
    // 하나라도 음수인 경우
    if musicCount < 0 || p1Count < 0 || p2Count < 0 || p3Count < 0 {
        return 0
    }
    
    // 녹음 할 음악이 없는 경우
    if musicCount == 0 {
        if p1Count == 0 && p2Count == 0 && p3Count == 0 {       // base 부분
            return 1
        }
        return 0
    }
    
    // 이미 해당 케이스의 경우를 구한 경우
    if dp[musicCount][p1Count][p2Count][p3Count] != -1 {
        return dp[musicCount][p1Count][p2Count][p3Count]
    }
    
    var temp = 0
    // N-1개의 음악을 녹음하는 경우의 수 7가지
    temp += calculate(musicCount-1, p1Count-1, p2Count, p3Count)
    temp %= 1000000007
    temp += calculate(musicCount-1, p1Count, p2Count-1, p3Count)
    temp %= 1000000007
    temp += calculate(musicCount-1, p1Count, p2Count, p3Count-1)
    temp %= 1000000007
    temp += calculate(musicCount-1, p1Count-1, p2Count-1, p3Count)
    temp %= 1000000007
    temp += calculate(musicCount-1, p1Count-1, p2Count, p3Count-1)
    temp %= 1000000007
    temp += calculate(musicCount-1, p1Count, p2Count-1, p3Count-1)
    temp %= 1000000007
    temp += calculate(musicCount-1, p1Count-1, p2Count-1, p3Count-1)
    temp %= 1000000007
    
    dp[musicCount][p1Count][p2Count][p3Count] = temp % 1000000007
    
    return temp
}

print(calculate(music, p1, p2, p3))
