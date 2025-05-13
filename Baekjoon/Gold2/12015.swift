// 12015 - 가장 긴 증가하는 부분 수열 2
// 1초 시간제한, 입력 100만

import Foundation

let N = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map{Int(String($0))!}
var temp = [Int]()
temp.append(nums[0])

func binarySearch(_ start: Int, _ end: Int, _ arr: [Int], _ target: Int) -> Int {
    var left = start, right = end
    var mid = (left + right) / 2
    var answer = mid
    
    while left <= right {           // left와 right가 같을 때까지 반복
        mid = (left + right) / 2
        
        if arr[mid] < target {      // temp의 mid값이 현재 넣으려는 값보다 작은 경우
            answer = mid + 1        // mid 다음숫자를 변경해야 함!!!
            left = mid + 1
        } else {
            answer = mid            // temp의 mid값이 현재 넣으려는 값보다 큰 경우
            right = mid - 1         // 현재 값을 변경
        }
    }
    
    return answer
}

for i in 1..<N {
    if temp.last! < nums[i] {
        temp.append(nums[i])            // temp의 길이가 항상 늘어나는 경우
    } else {                            // temp의 길이는 일정하되, temp의 숫자 중 하나를 변경하는 경우, 숫자를 변경하기 때문에 temp.count - 1의 범위
        let index = binarySearch(0, temp.count - 1, temp, nums[i])
        temp[index] = nums[i]
    }
}
print(temp.count)

/// 반례
/// 8
/// 10 20 30 5 10 20 30 40

