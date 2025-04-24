// k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자
// 2 <= number <= 100만 자리 (순열은 안됨)
// 스택을 사용하자 ! 

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack = [Int]()
    var nums = number.map{Int(String($0))!}
    
    var deleteCount = 0
    for n in nums {
        if deleteCount == k {       // 이미 k개를 지웠다면 삽입
            stack.append(n)
            continue
        }
        if stack.isEmpty {          // 스택이 비어있는 경우 무조건 삽입
            stack.append(n)
        } else {                    // 스택이 비어있지 않고,
            if stack.last! < n {    // 스택의 마지막이 현재 숫자보다 작은 경우
                // 스택이 비어있지 않고, 스택의 마지막이 현재 값보다 작고, 삭제 원소의 개수가 k개 미만인 경우
                while !stack.isEmpty && stack.last! < n && deleteCount < k {
                    _ = stack.popLast()  // stack의 마지막 원소 제거
                    deleteCount += 1     // 제거 카운트 + 1
                }
            }
            stack.append(n)
        }
    }
    
    // 만약 k개를 제거하지 않은 경우 뒤에서부터 숫자 제거
    if deleteCount < k {
        while deleteCount != k {
            _ = stack.popLast()
            deleteCount += 1
            
        }
    }
    
    return stack.map{String($0)}.joined()
}
