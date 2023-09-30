import Foundation

// 상수 앞에 아래서 위로 쌓임
// 빵 - 야채 - 고기 - 빵
// 야채, 빵, 빵, 야채, 고기, 빵, 야채, 고기, 빵
// 1, 2, 3, 1 순서여야함
func solution(_ ingredient:[Int]) -> Int {
    var result = 0
    var stack: [Int] = []
    for i in ingredient {    // 주어진 재료 하나씩 추가
        stack.append(i)
        
        if stack.count < 4 { continue }     // 4개 이하이면 햄버거를 만들 수 없음
        
        if Array(stack[stack.count-4..<stack.count]) == [1, 2, 3, 1] {
            result += 1
            stack = Array(stack[0..<stack.count - 4])
        }
    }
    
    return result
}
