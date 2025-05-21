// 1753 - 최단경로
// V: 2만, E: 30만
// u, v는 서로 다르고 w는 10 이하의 자연수
// 두 정점 사이 여러 개 간선이 존재할 수 있음

import Foundation

struct Heap<T> {
    private var heap: [T] = []
    private var compare: (T, T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var count: Int {
        return heap.count
    }
    
    var peek: T? {
        return heap.first
    }
    
    mutating func insert(_ element: T) {
        heap.append(element)
        shiftUp(heap.count - 1)
    }
    
    mutating func pop() -> T? {
        if heap.isEmpty {
            return nil
        }
        
        heap.swapAt(0, heap.count-1)
        let root = heap.removeLast()
        shiftDown(0)
        
        return root
    }
    
    mutating func shiftUp(_ index: Int) {
        var child = index
        
        while child > 0 {
            let parent = parentIndex(child)
            
            if !compare(heap[parent], heap[child]) {            // parent < child가 아니면, 즉 parent > child인 경우
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
            let left = leftIndex(parent)
            let right = rightIndex(parent)
            var candidate = parent
            
            if left < heap.count && compare(heap[left], heap[candidate]) {      // left < candidate
                candidate = left
            }
            
            if right < heap.count && compare(heap[right], heap[candidate]) {    // right < candidate
                candidate = right
            }
            
            if candidate == parent {
                break
            }
            
            heap.swapAt(candidate, parent)
            parent = candidate
        }
    }
    
    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftIndex(_ index: Int) -> Int {
        return (index * 2) + 1
    }
    
    private func rightIndex(_ index: Int) -> Int {
        return (index * 2) + 2
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let V = input[0]
let E = input[1]
let start = Int(readLine()!)!

/// 그래프 구성
var graph = Array(repeating: [(Int, Int)](), count: V+1)

for _ in 0..<E {
    let path = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = path[0], v = path[1], w = path[2]
    
    graph[u].append((v, w))
}

/// 다익스트라 알고리즘
var dist = Array(repeating: Int.max, count: V+1)
var minHeap = Heap<(Int, Int)>(compare: {$0.1 < $1.1})      // 노드, 거리
var checked = Array(repeating: false, count: V+1)
dist[start] = 0
minHeap.insert((start, 0))

while !minHeap.isEmpty {
    let (currentNode, _) = minHeap.pop()!
    if checked[currentNode] { continue }
    checked[currentNode] = true
    
    for (nextNode, nextDist) in graph[currentNode] {
        if dist[nextNode] > dist[currentNode] + nextDist {
            dist[nextNode] = dist[currentNode] + nextDist
            minHeap.insert((nextNode, dist[nextNode]))          // 간선 길이가 아닌, 누적거리가 짧은 순으로 정렬하기 때문에 누적거리를 넣어줌
        }
    }
}

for i in 1...V {
    dist[i] == Int.max ? print("INF") : print(dist[i])
}

