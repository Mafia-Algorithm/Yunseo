// 9934 - 완전 이진 트리
// prefix 출력

import Foundation

let k = Int(readLine()!)!
let buildings = readLine()!.split(separator: " ").map{Int(String($0))!}
var tree: [[Int]] = Array(repeating: [Int](), count: k)

func prefix(_ start: Int, _ end: Int, _ depth: Int) {
    if start > end { return }               // start가 더 커지면 유효하지 않은 범위
    
    let mid = (start + end) / 2
    tree[depth].append(buildings[mid])
    
    prefix(start, mid-1, depth + 1)
    prefix(mid+1, end, depth + 1)
}

prefix(0, buildings.count - 1, 0)
tree.forEach {
    print($0.map{String($0)}.joined(separator: " "))
}

