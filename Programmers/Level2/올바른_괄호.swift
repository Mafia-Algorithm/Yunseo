import Foundation

func solution(_ s:String) -> Bool {
    var ans: Bool = false
    var stack: [Character] = []
    
    for chr in s {
        if chr == "(" {
            stack.append(chr)
        } else {
            if stack.isEmpty { return false }
            _ = stack.popLast()
        }
    }

    return stack.isEmpty ? true : false
}
