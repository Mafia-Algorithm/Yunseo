// 15655 - N과 M(6)

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var nums = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted{$0 < $1}

var answer = ""
func combination(_ index: Int, _ temp: inout [Int]) {
    if temp.count == m {
        answer.append(temp.map{String($0)}.joined(separator: " ") + "\n")
    }
    
    for i in index..<nums.count {
        temp.append(nums[i])
        combination(i+1, &temp)
        _ = temp.removeLast()
    }
}

var temp = [Int]()
combination(0, &temp)
print(answer)

