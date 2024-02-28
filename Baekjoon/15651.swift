// 15651 - N과 M(3) 순열

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var array = [Int]()
var result = ""
for i in 0..<input[0] {
    array.append(i+1)
}

var temp = 0
func permutation(_ index: Int, _ now: [Int]) {
    if now.count == input[1] {
        result += now.map{String($0)}.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in 0..<array.count {
        permutation(i, now + [array[i]])
    }
}

permutation(0, [])
print(result)

