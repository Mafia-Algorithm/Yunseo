// 15654 - N과 M(5)

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var array = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var visit = Array(repeating: false, count: array.count)

var result = ""

func permutation(_ now: [Int]) {
    if now.count == input[1] {
        result += now.map{String($0)}.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in 0..<array.count {
        if !visit[i] {
            visit[i] = true
            permutation(now + [array[i]])
            visit[i] = false
        }
    }
}

permutation([])
print(result)

