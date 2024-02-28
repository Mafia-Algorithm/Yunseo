// 15650 - N와 M(2) 조합

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var array = [Int]()
for i in 1...input[0] {
    array.append(i)
}

var visit = Array(repeating: false, count: array.count)

func combination(_ index: Int, _ now: [Int]) {
    if now.count == input[1] {
        now.forEach{ print($0, terminator: " ") }
        print()
        return
    }
    
    for i in index..<array.count {
        if !visit[i] {
            visit[i] = true
            combination(i+1, now + [array[i]])
            visit[i] = false
        }
    }
}

combination(0, [])
