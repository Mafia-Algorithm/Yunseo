// 1715 - 카드 정렬하기
// 고르는 순서에 따라 비교 횟수가 달라짐
// 10, 20, 40
// (10 + 20) + (30 + 40) = 100번
// (10 + 40) + (50 + 20) = 120번
// 최소한 몇 번의 비교가 필요한지 구하시오.

import Foundation

struct MinHeap<T: Comparable> {
    var heap: [T] = []
    var peek: T? {
        return heap.first
    }
    var isEmpty: Bool {
        return heap.isEmpty
    }
    var count: Int {
        return heap.count
    }
    
    mutating func insert(_ element: T) {
        heap.append(element)
        
        if heap.count != 1 {
            shiftUp(heap.count - 1)
        }
    }
    
    mutating func pop() -> T? {
        if heap.isEmpty {
            return nil
        }
        
        var target: T?
        if heap.count == 1 {
            target = heap.popLast()
        } else {
            heap.swapAt(0, heap.count - 1)
            target = heap.popLast()
        }
        
        shiftDown(0)
        return target
    }
    
    mutating func shiftDown(_ index: Int) {
        var parent = index
    
        while true {
            let left = findLeftChild(parent)
            let right = findRightChild(parent)
            var candidate = parent
            
            if left < heap.count && heap[left] < heap[candidate] {
                candidate = left
            }
            
            if right < heap.count && heap[right] < heap[candidate] {
                candidate = right
            }
            
            if parent == candidate {
                break
            }
            heap.swapAt(candidate, parent)
            parent = candidate
        }
    }
    
    mutating func shiftUp(_ index: Int) {
        var child = index
        while child > 0 {
            let parent = findParent(child)
            
            if heap[parent] > heap[child] {
                heap.swapAt(parent, child)
                child = parent
            } else {
                break
            }
        }
    }
    
    private func findParent(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func findLeftChild(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func findRightChild(_ index: Int) -> Int {
        return index * 2 + 2
    }
}

let N = Int(readLine()!)!
var card = MinHeap<Int>()

for _ in 0..<N {
    card.insert(Int(readLine()!)!)
}

if N == 1 {         // 카드 묶음이 1개일 때는 비교할 필요가 없음
    print(0)
} else {
    var answer = 0
    while card.count > 1 {
        let temp = card.pop()! + card.pop()!        // 힙에서 최소값 2개를 꺼내서 계산
        answer += temp
        card.insert(temp)                           // 합한 값을 다시 최소힙에 삽입
    }
    print(answer)
}

/// 반례
/// 4 / 1 2 3 4
/// 3 + 6 + 10 = 19
/// 3 + (3+6) = 12
/// answer = 12 + 3 =


