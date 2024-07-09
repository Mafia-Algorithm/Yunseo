// 2504 - 괄호의 값(1초, 128MB)

import Foundation

let str = readLine()!.map{String($0)}

/// 스택 구현
struct Stack<T> {
    var storage: [T] = []
    
    public init() {}
    
    public mutating func push(_ element: T) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        return storage.popLast()
    }
    
    public func peek() -> T? {
        return storage.last
    }
    
    public func isEmpty() -> Bool {
        return storage.count == 0
    }
    
    public func count() -> Int {
        return storage.count
    }
}

/// 솔루션 함수
func solution(_ str: [String]) -> Int {
    var stack = Stack<String>()
    var answer = 0
    var temp = 1                            // 곱셈 연산값 저장
    
    for s in 0..<str.count {
        switch str[s] {
        case "[":
            stack.push(str[s])
            temp *= 3
        case "(":
            stack.push(str[s])
            temp *= 2
        case "]":
            if stack.isEmpty() || stack.peek() == "(" {
                return 0
            }
            if str[s-1] == "[" {
                answer += temp
            }
            temp /= 3
            stack.pop()
        case ")":
            if stack.isEmpty() || stack.peek() == "[" {      // 짝이 맞지 않는 경우
                return 0
            }
            if str[s-1] == "(" {                            // 같은 괄호 짝꿍이 남아있는 경우 중첩이므로 더하지 않음
                answer += temp
            }
            temp /= 2
            stack.pop()
        default:
            break
        }
        
    }
    return stack.isEmpty() ? answer : 0                     // [][ 같은 경우 방지. 스택이 비어있는 경우에만 answer
}

print(solution(str))
