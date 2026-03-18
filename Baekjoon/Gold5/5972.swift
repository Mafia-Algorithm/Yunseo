// 5972 - 택배 배송

// 양방향 길이 있고 1 -> N으로 가는 최단 거리 찾기
// 다익스트라?

import Foundation

// 힙 구현
struct Heap<T> {
    private var elements: [T]
    private let compare: (T, T) -> Bool
    
    init(elements: [T], compare: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.compare = compare
    }
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: T? {
        return elements.first
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        shiftUp(elements.count - 1)
    }
    
    mutating func pop() -> T? {
        if elements.isEmpty { return nil }
        
        elements.swapAt(0, elements.count - 1)
        shiftDown(0)
        
        return elements.popLast()
    }
    
    mutating func shiftUp(_ index: Int) {
        var index = index
        while true {
            let parent = self.parentIndex(index)
            
            if index == parent || !compare(elements[index], elements[parent]) {
                break
            }
            
            elements.swapAt(index, parent)
            index = parent
        }
    }
    
    mutating func shiftDown(_ index: Int) {
        var index = index
        while true {
            var candidate = index
            var left = self.leftChildIndex(index)
            var right = self.rightChildIndex(index)
            let parent = candidate
            
            if left < elements.count && compare(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < elements.count && compare(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                break
            }
            
            index = candidate
            elements.swapAt(candidate, parent)
        }
    }
    
    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChildIndex(_ index: Int) -> Int {
        return index * 2 + 2
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]

// graph[a] -> a에서 to로 갈 수 있는 비용 cost
var graph = Array(repeating: [(to: Int, cost: Int)](), count: n + 1)
var dist = Array(repeating: Int.max, count: n + 1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = edge[0], b = edge[1], c = edge[2]
    
    graph[a].append((to: b, cost: c))
    graph[b].append((to: a, cost: c))
}

/// (Int, Int): (도착 지점, 비용)
var minHeap = Heap<(Int, Int)>(elements: []) { $0.1 < $1.1 }

dist[1] = 0
minHeap.insert((1, 0))

while true {
    /// 더 이상 경로가 없다면 종료
    guard let (dest, _) = minHeap.pop() else { break }
    
    for (d, c) in graph[dest] {         // 다음에 갈 수 있는 경로 찾기
        // 현재 d까지 갈 수 있는 비용과 dest를 통해 갈 수 있는 비용 비교
        if dist[d] > dist[dest] + c {
            dist[d] = dist[dest] + c
            minHeap.insert((d, c))
        }
    }
}

print(dist[n])

