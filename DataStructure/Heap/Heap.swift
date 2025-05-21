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
            
            if !compare(heap[parent], heap[child]) {
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
            
            if left < heap.count && compare(heap[left], heap[candidate]) {
                candidate = left
            }
            
            if right < heap.count && compare(heap[right], heap[candidate]) {
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

var minHeap = Heap<Int>(compare: {$0 < $1})
var maxHeap = Heap<Int>(compare: {$0 > $1})

