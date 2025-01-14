// 균형잡힌 괄호 문자열: (, ) 개수 같은 경우
// 올바른 괄호 문자열: 괄호 짝이 모두 맞을 경우

import Foundation

func solution(_ p:String) -> String {
    return recursion(p.map{String($0)}).joined()
}

// 올바른 괄호 문자열인지 확인
func checkRight(_ u: [String]) -> Bool {
    var stack = [String]()
    
    for str in u {
        if str == "(" {
            stack.append(str)
        } else {
            if stack.isEmpty { return false }
            _ = stack.popLast()
        }
    }
    
    return stack.isEmpty
}

// 문자열 괄호 방향 뒤집기
func reverse(_ u: [String]) -> [String] {
    var result: [String] = []
    u.forEach {
        if $0 == "(" {
            result.append(")")
        } else {
            result.append("(")
        }
    }
    return result
}

// 문자열 분리
func splitStr(_ w: [String]) -> [[String]] {
    var s = [String]()
    var v = w
    var leftCount = 0
    var rightCount = 0
    
    for i in w {
        s.append(v.removeFirst())
        if i == "(" { leftCount += 1 }
        else if i == ")" { rightCount += 1 }
        
        if leftCount == rightCount { break }
    }
    
    return [s, v]
}

func recursion(_ w: [String]) -> [String] {
    if w.count == 0 { return w }                // 빈 문자열이면 반환
    
    let split = splitStr(w)                     // w를 u, v로 나눔
    var u = split[0]
    var v = split[1]
    
    if checkRight(u) {                          // u가 올바른 괄호 문자열인 경우
        u.append(contentsOf: recursion(v))
        return u
    } else {                                    // u가 올바른 괄호 문자열이 아닌 경우
        var result = ["("]
        result.append(contentsOf: recursion(v))
        result.append(")")
        u.removeFirst()
        u.removeLast()
        result.append(contentsOf: reverse(u))
        return result
    }
}
