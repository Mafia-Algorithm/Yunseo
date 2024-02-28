// 15652 - N과 M(4) 중복 조합 -> 중복을 허용하기 때문에 방문 배열 필요 없음

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var array = [Int]()
var result = ""

for i in 1...input[0] {
    array.append(i)
}

func combination(_ index: Int, _ now: [Int]) {
    if now.count == input[1] {
        result += now.map{String($0)}.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in index..<array.count {
        combination(i, now + [array[i]])
    }
}

combination(0, [])
print(result)

