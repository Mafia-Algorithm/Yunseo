// 2437 - 저울

import Foundation

let N = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map{Int(String($0))!}
nums.sort(by: <)

// nums[i]가 만들 수 없는 최솟값보다 큰 경우, answer은 절대 만들 수 없음(기존 값에 nums[i]를 더하기 때문)
// nums[i]가 만들 수 없는 최솟값보다 작은 경우, 기존에 만들 수 있는 값에 nums[i]를 더하면 answer를 만들 수 있음, 1 ~ answer + nums[i] -1
var answer = 1
for i in 0..<N {
    if nums[i] > answer {
        break
    } else {
        answer += nums[i]
    }
}

print(answer)

