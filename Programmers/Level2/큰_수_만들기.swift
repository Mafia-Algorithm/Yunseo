// 그리디, 스택 사용

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var numberArray = number.map{Int(String($0))!}
    var answer: [Int] = [numberArray[0]]
    
    var idx = 1
    var remove = 0
    
    while idx < numberArray.count {
        // stack이 비어있지 않고, stack에 있는 최상위 값이 현재 값보다 작으며, 지워야하는 개수가 남은 경우 pop
        // 하나만 pop하면 안됨. ex) answer = [4, 1], num = 7일 때 하나만 확인하면 [4, 7]이 됨
        while !answer.isEmpty && answer.last! < numberArray[idx] && remove < k {
            _ = answer.popLast()!
            remove += 1
        }
        
        // 모두 제외한 경우 현재 숫자 추가
        answer.append(numberArray[idx])
        idx += 1
    }
    
    // 만약 완성한 숫자가 만들어야하는 숫자보다 긴 경우 꼬리 자르기
    if answer.count > number.count - k {
        answer = answer.dropLast(answer.count - (number.count - k))
    }
    
    return answer.map{String($0)}.joined(separator: "")
}
