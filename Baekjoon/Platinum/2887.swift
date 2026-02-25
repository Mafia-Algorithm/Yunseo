// 2887 - 행성 터널

import Foundation

let n = Int(readLine()!)!
var planets: [(num: Int, x: Int, y: Int, z: Int)] = []

for i in 0..<n {
    let planet = readLine()!.split(separator: " ").map{Int(String($0))!}
    planets.append((num: i, x: planet[0], y: planet[1], z: planet[2]))
}

/// 유니온 파인드

var parent: [Int] = []

for i in 0..<n {
    parent.append(i)
}

/// x가 속한 군집 찾기
func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    
    return parent[x]
}

func union(_ x: Int, _ y: Int) {
    let px = find(x)
    let py = find(y)
    
    if px != py {
        parent[px] = py
    }
}

/// 정렬
var edges: [(cost: Int, u: Int, v: Int)] = []       // 비용, 행성1, 행성2

planets.sort { $0.x < $1.x }
for i in 0..<n-1 {
    edges.append((cost: planets[i+1].x - planets[i].x,
                  u: planets[i].num,
                  v: planets[i+1].num))
}

planets.sort { $0.y < $1.y }
for i in 0..<n-1 {
    edges.append((cost: planets[i+1].y - planets[i].y,
                  u: planets[i].num,
                  v: planets[i+1].num))
}

planets.sort { $0.z < $1.z }
for i in 0..<n-1 {
    edges.append((cost: planets[i+1].z - planets[i].z,
                  u: planets[i].num,
                  v: planets[i+1].num))
}

edges.sort{ $0.cost < $1.cost }

// 크루스칼
var answer = 0
var index = 0

while index < edges.count {
    let path = edges[index]
    
    if find(path.u) != find(path.v) {
        union(path.u, path.v)
        answer += path.cost
    }
    
    index += 1
}

print(answer)

// 문제 풀이 과정

// 1. 브루트포스
//(n * (n-1)) / 2
//1000000 * 500000 = 500,000,000,000 (5천억) -> 불가

// 2. 어떻게 구하지 ..
// 1) x축 작은 순서대로 정렬
// 2) y축 작은 순서대로 정렬
// 3) z축 작은 순서대로 정렬
// -> 3(n-1)
// 어차피 i, i+1 사이 비용은 i, i+2 비용보다 무조건 작음
// 그게 x, y, z 중 어느 것인지 모르기 때문에 일단 다 구해서 edges에 넣기

// 3. 모든 노드를 잇는 최소 비용 -> 최소 스패닝 트리 (크루스칼 + 유니온파인드)
// 모든 노드를 잇는데 최소 비용으로 잇기 위해서 edges 정보 활용
// - edges의 비용을 오름차순 정렬해서 union

