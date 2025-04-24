import Foundation

// 최소 힙 구현
struct MinHeap<T> {
    private var elements: [T] = []
    private var compare: (T, T) -> Bool
    
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }
    
    init (compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        shiftUp(elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeLast()
        }
        
        elements.swapAt(0, elements.count - 1)
        let removed = elements.removeLast()
        
        shiftDown(0)
        
        return removed
    }
    
    mutating func shiftUp(_ index: Int) {
        var childIndex = index
        
        while childIndex > 0 {
            let parentIndex = self.parentIndex(of: childIndex)
            
            if compare(elements[childIndex], elements[parentIndex]) {
                elements.swapAt(childIndex, parentIndex)
                childIndex = parentIndex
            } else {
                break
            }
        }
    }
    
    mutating func shiftDown(_ index: Int) {
        var parentIndex = index
        let count = elements.count
        
        while true {
            let leftChild = self.leftChildIndex(from: parentIndex)
            let rightChild = self.rightChildIndex(from: parentIndex)
            var smallest = parentIndex
            
            if leftChild < count && compare(elements[leftChild], elements[smallest]) {
                smallest = leftChild
            }
            
            if rightChild < count && compare(elements[rightChild], elements[smallest]) {
                smallest = rightChild
            }
            
            if smallest == parentIndex { break }
            elements.swapAt(smallest, parentIndex)
            
            parentIndex = smallest
        }
    }
    
    private func leftChildIndex(from index: Int) -> Int { return (index * 2) + 1 }
    private func rightChildIndex(from index: Int) -> Int { return (index * 2) + 2 }
    private func parentIndex(of index: Int) -> Int { return (index - 1) / 2 }
}



func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // 그래프 구성
    var graph = Array(repeating: [Int](), count: n+1)
    edge.forEach {
        graph[$0[0]].append($0[1])
        graph[$0[1]].append($0[0])
    }
    
    // 최단거리 저장하는 데이터
    var distance = Array(repeating: Int.max, count: n+1)
    var minHeap = MinHeap<(Int, Int)>{ $0.1 < $1.1 }        // 노드 번호, 최단거리(최단거리 오름차순 정렬)
    distance[1] = 0
    minHeap.insert((1, distance[1]))
    
    // 다익스트라
    while !minHeap.isEmpty {                                // 최소 힙이 비어있을 때까지 반복
        let (node, dist) = minHeap.remove()!
        
        for n in graph[node] {                              // node -> n으로 가는 경우의 수 확인
            if distance[n] > dist + 1 {                     // 최단거리가 변경된 경우만 힙에 삽입
                distance[n] = dist + 1
                minHeap.insert((n, distance[n]))
            }
        }
    }
    
    _ = distance.removeFirst()
    let maxDist = distance.max()!
    
    return distance.filter{ $0 == maxDist }.count          // 거리의 최댓값을 가지는 노드의 개수
}
