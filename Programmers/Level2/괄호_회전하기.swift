// 1. 회전 로직
// 2. 올바른 괄호 문자열 판단 로직

/// [](){} -> ](){}[

import Foundation

func solution(_ s:String) -> Int {
    var target = s
    
    /// 한 번 회전
    func rotate(_ str: String) -> String {
        var str = str
        str.append(str.removeFirst())
        return str
    }
    
    // 괄호 짝꿍 찾기
    func checkPair(_ str: String) -> Bool {
        var str = str.map{String($0)}
        var stack = [String]()
        
        stack.append(str[0])
        
        for s in 1..<str.count {
            var char = str[s]
            
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else if 
                char == "}" && !stack.isEmpty && stack.last! == "{" || 
                char == "]" && !stack.isEmpty && stack.last! == "[" || 
                char == ")" && !stack.isEmpty && stack.last! == "(" {
                    stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        
        return stack.isEmpty
    }
    
    var answer = 0
    for _ in 0..<s.count {
        if checkPair(target) { answer += 1 }        // 괄호 짝꿍 확인
        target = rotate(target)                     // 1회 회전
    }
    
    return answer
}

/// 방법2) replacingOccurrences 사용
// while string.contains("{}") || string.contains("[]") || string.contains("()") {
//     string = string.replacingOccurrences(of: "{}", with: "")
//     string = string.replacingOccurrences(of: "()", with: "")
//     string = string.replacingOccurrences(of: "[]", with: "")
// }


// if string.count == 0 {
//     answer += 1
// }
