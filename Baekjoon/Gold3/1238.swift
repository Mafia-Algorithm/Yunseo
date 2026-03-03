// 1238 - 파티

// 최단 시간을 구하되, 가장 많은 거리를 이동하는 학생 찾기

import Foundation

struct Heap<T> {
    private var heap: [T] = []
    private let compare: (T, T) -> Bool
    
    init(heap: [T], compare: @escaping (T, T) -> Bool) {
        self.heap = heap
        self.compare = compare
    }
    
    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    var peek: T? { heap.first }
    
    mutating func pop() -> T? {
        if heap.isEmpty {
            return nil
        }
        
        let value = heap.first
        heap.swapAt(0, heap.count - 1)
        shiftDown(from: 0)
        
        return heap.removeLast()
    }
    
    mutating func insert(_ item: T) {
        heap.append(item)
        shiftUp(from: heap.count-1)
    }
    
    mutating func shiftUp(from index: Int) {
        var childIndex = index
        while true {
            let parentIndex = self.parentIndex(from: childIndex)
            
            /// 더 이상 부모 노드가 없거나 값 정렬이 잘 되어있는 경우
            if parentIndex == childIndex || !compare(heap[childIndex], heap[parentIndex]) {
                break
            }
            
            heap.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
        }
    }
    
    mutating func shiftDown(from index: Int) {
        var parent = index
        while true {
            let left = self.leftChildIndex(from: parent)
            let right = self.rightChildIndex(from: parent)
            var candidate = parent
            
            if left < heap.count && compare(heap[left], heap[candidate]) {
                candidate = left
            }
            
            if right < heap.count && compare(heap[right], heap[candidate]) {
                candidate = right
            }
            
            /// 정렬이 바뀌지 않은 경우
            if candidate == parent { break }
            heap.swapAt(candidate, parent)
            parent = candidate
        }
    }
    
    private func parentIndex(from index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(from index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChildIndex(from index: Int) -> Int {
        return index * 2 + 2
    }
}

func calculdateCost(_ start: Int, map: [[(Int, Int)]]) {
    var minHeap = Heap<(Int, Int)>(heap: [(start, 0)]){ $0.1 < $1.1 }       // node, cost
    cost[start] = 0
    
    while !minHeap.isEmpty {
        guard let node = minHeap.pop() else { return }
        
        // node에서 갈 수 있는 다음 노드인 next까지의 비용 계산
        for next in map[node.0] {
            let newCost = node.1 + next.1
            if newCost < cost[next.0] {         // 새 비용과 기존 비용 비교
                cost[next.0] = newCost
                minHeap.insert((next.0, newCost))
            }
        }
    }
}


let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1], x = input[2]

var graph = Array(repeating: [(Int, Int)](), count: n+1)        // 목적지, 비용
var reverseGraph = Array(repeating: [(Int, Int)](), count: n+1)
var cost = Array(repeating: Int.max, count: n+1)

for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[info[0]].append((info[1], info[2]))
    reverseGraph[info[1]].append((info[0], info[2]))
}

/// i -> X 비용
/// (간선 정보를 반대로 저장하고 X를 출발지로 하면 (1~n)을 출발지로 설정해서 다익스트라 탐색하지 않고 X를 출발지로 한 번만 탐색할 수 있음
calculdateCost(x, map: reverseGraph)
let fromX = cost

/// /// X -> i 비용
cost = Array(repeating: Int.max, count: n+1)
calculdateCost(x, map: graph)
let toX = cost

var answer = (1...n).map{ fromX[$0] + toX[$0] }.max()!
print(answer)

