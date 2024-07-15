import Foundation

let count = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}

var left = 0                        // 왼쪽 인덱스
var right = count - 1               // 오른쪽 인덱스

var value = Int.max                 // 최적의 특성값

while left < right {
    let temp = nums[left] + nums[right]     // 용액 특성값 구하기
    
    // 새로 만든 특성값이 더 0에 가까운 경우 업데이트
    if abs(value) >= abs(temp) {
        value = temp
    }
    
    if temp == 0 {                  // 0과 같으면 종료
        break
    } else if temp > 0 {            // 0보다 클 때 -> 더 작은 수 더해야 작아짐 -> right 감소
        right -= 1
    } else {                        // 0보다 작을 때 -> 더 큰 수 더해야 작아짐 -> left 증가
        left += 1
    }
}

print(value)
