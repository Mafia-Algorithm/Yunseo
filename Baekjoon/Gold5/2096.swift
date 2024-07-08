// 2096 - 내려가기(1초, 4MB)

import Foundation

let N = Int(readLine()!)!
var nums: [[Int]] = []
var dpMax = Array(repeating: Array(repeating: 0, count: 3), count: N)               // 최댓값
var dpMin = Array(repeating: Array(repeating: 0, count: 3), count: N)               // 최솟값

for _ in 0..<N {
    nums.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

dpMax = nums
dpMin = nums

for i in 1..<N {
    for j in 0..<3 {
        if j == 0 {
            dpMax[i][j] = nums[i][j] + max(dpMax[i-1][j], dpMax[i-1][j+1])
            dpMin[i][j] = nums[i][j] + min(dpMin[i-1][j], dpMin[i-1][j+1])
        } else if j == 1 {
            dpMax[i][j] = nums[i][j] + max(dpMax[i-1][j-1], dpMax[i-1][j], dpMax[i-1][j+1])
            dpMin[i][j] = nums[i][j] + min(dpMin[i-1][j-1], dpMin[i-1][j], dpMin[i-1][j+1])
        } else {
            dpMax[i][j] = nums[i][j] + max(dpMax[i-1][j], dpMax[i-1][j-1])
            dpMin[i][j] = nums[i][j] + min(dpMin[i-1][j], dpMin[i-1][j-1])
        }
    }
}

print(dpMax[N-1].max()!, dpMin[N-1].min()!)

