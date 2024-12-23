// 오른쪽 값을 탐색해야 함 → 과거의 숫자를 기억해야 함 → 스택이 적합.(자신보다 크면서 가장 가까이 있는 수)
// 뒷큰수를 차례대로 담아야 함 → Index로 관리
// append는 결과 순대로 값을 저장하는데, 모든 원소에 대한 순서를 유지할 수 없기 때문에 index로 관리

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var answer = Array(repeating: -1, count: numbers.count)
    var stack: [Int] = []       // numbers의 index를 넣어줌
    
    for i in 0..<numbers.count {
        // 스택이 비어있지 않고, 스택 마지막 값이 현재 값보다 작다면
        while (!stack.isEmpty && numbers[stack.last!] < numbers[i]) {
            answer[stack.popLast()!] = numbers[i]
        }
        
        stack.append(i)
    }
    
    return answer
}
