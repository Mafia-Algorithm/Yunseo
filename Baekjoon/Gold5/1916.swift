// 1916 - 최소비용 구하기(0.5초, 128MB)

import Foundation

/// 최소 힙 구현
struct MinHeap<T> {
    var heap: [T] = []
    var compare: (T, T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    var isEmpty: Bool {
        return heap.isEmpty
    }
    var count: Int {
        return heap.count
    }

    mutating func push(_ element: T) {
        if heap.isEmpty {
            heap.append(element)
        } else {
            heap.append(element)
            shiftUp(heap.count - 1)
        }
    }
    
    mutating func pop() -> T? {
        if heap.count == 1 {
            return heap.popLast()
        } else {
            let smallest = heap.first!
            heap.swapAt(0, heap.count - 1)
            _ = heap.popLast()
            shiftDown(0)
            return smallest
        }
    }
    
    mutating func shiftUp(_ index: Int) {
        var child = index
        while child > 0 {
            let parent = parentIndex(child)
            
            if compare(heap[child], heap[parent]) {
                heap.swapAt(parent, child)
                child = parent
            } else {
                break
            }
        }
    }
    
    mutating func shiftDown(_ index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(parent)
            let right = rightChildIndex(parent)
            var smallest = parent
            
            if left < heap.count && compare(heap[left], heap[smallest]) {           // smallest와 비교하는 거 실수하지 말기..
                smallest = left
            }
            
            if right < heap.count && compare(heap[right], heap[smallest]) {
                smallest = right
            }
            
            if smallest == parent {
                break
            }
            heap.swapAt(parent, smallest)
            parent = smallest
        }
    }
    
    
    private func parentIndex(_ index: Int) -> Int {
        return (index-1) / 2
    }
    
    private func leftChildIndex(_ index: Int) -> Int {
        return index*2 + 1
    }
    
    private func rightChildIndex(_ index: Int) -> Int {
        return index*2 + 2
    }
}

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]][input[1]] = min(input[2], graph[input[0]][input[1]])        // 1 -> 2로 가는 방법이 여러 개일 수 있음
}

for i in 1...N {
    graph[i][i] = 0
}

let cities = readLine()!.split(separator: " ").map{Int(String($0))!}
let start = cities[0], end = cities[1]

/// 다익스트라 구현
var dist = Array(repeating: Int.max, count: N+1)
var checked = Array(repeating: false, count: N+1)
dist[start] = 0

var heap = MinHeap<(Int, Int)>(compare: <)      // 거리, 도시
heap.push((0, start))

while !heap.isEmpty {
    let (currentDist, currentCity) = heap.pop()!
    if checked[currentCity] { continue }        // 이미 방문했던 도시라면 생략(최단거리임)
    checked[currentCity] = true
    
    for next in 1...N {
        if checked[next] || graph[currentCity][next] == Int.max { continue }        // next가 방문했던 도시이거나 currentCity에서 다음 도시로 갈 수 없는 경우 continue
        
        if dist[next] >= currentDist + graph[currentCity][next] {                   // 값 갱신
            dist[next] = currentDist + graph[currentCity][next]
            heap.push((dist[next], next))
        }
    }
}
print(dist[end])

