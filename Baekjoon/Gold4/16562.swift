// 16562 - 친구비

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1], k = input[2]
let cost = readLine()!.split(separator: " ").map{Int(String($0))!}

/// 유니온 파인드
var parent: [Int] = []
for i in 0...N {
    parent.append(i)
}

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ x: Int, _ y: Int) {
    let rx = find(x)
    let ry = find(y)
    if rx != ry {
        parent[rx] = ry
    }
}

/// 친구관계 모두 유니온
for _ in 0..<M {
    let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
    union(relation[0], relation[1])
}

var minCost: [Int: Int] = [:]
for i in 1...N {                // i번 친구의 루트 친구를 구함
    let root = find(i)
    // root 친구 비용(이 친구 무리를 사귀려면 내야하는 비용)
    minCost[root] = min((minCost[root] ?? Int.max), cost[i-1])      // root의 친구비용은 기존 root의 비용(또는 X) 와 i의 친구 비용 중 최소 비용
}

var sum = minCost.values.reduce(0, +)
if sum > k {
    print("Oh no")
} else {
    print(sum)
}
