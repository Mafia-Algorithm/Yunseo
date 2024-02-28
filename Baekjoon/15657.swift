// 15657 - N과 M(8)

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var array = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var visit = Array(repeating: false, count: array.count)
var result = ""

func combination( _ now: [Int], _ start: Int) {
    if now.count == input[1] {
        result += now.map{String($0)}.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in start..<array.count {          // 오름차순이기 때문에 지금 원소부터 다음에 시작해야함 -> start
        combination(now + [array[i]], i)
    }
}

combination([], 0)
print(result)

