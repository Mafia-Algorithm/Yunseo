// 4485 - 녹색 옷 입은 애가 젤다지?

// 첫번째 방식은 큐에 들어온 순서대로 계산 -> 먼저 들어온게 최단거리가 아닐 수 있음 (BFS)
// 큐 중에서 가장 작은 노드를 먼저 탐색 -> 항상 최단거리를 기준으로 탐색 (다익스트라)

// MARK: - 다익스트라 방식
import Foundation

// 다익스트라에 필요한 최소힙 구현
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

var i = 0
let dy = [0, 0, 1, -1]
let dx = [1, -1, 0, 0]
while true {
    let n = Int(readLine()!)!
    i += 1

    /// 종료 조건: 0이 입력되면 종료
    if n == 0 {
        break
    }

    /// 동굴 정보 저장
    var caves: [[Int]] = []
    for _ in 0..<n {
        let info = readLine()!.split(separator: " ").map{Int(String($0))!}
        caves.append(info)
    }

    /// 잃은 루피 상태 저장
    var rupeeStatus = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    rupeeStatus[0][0] = caves[0][0]

    bfs(n, &rupeeStatus, caves)
    print("Problem \(i): \(rupeeStatus[n-1][n-1])")
}

func bfs(_ n: Int, _ status: inout [[Int]], _ map: [[Int]]) {
    status[0][0] = map[0][0]
    var minHeap = Heap<(Int, Int, Int)>{$0.2 < $1.2}
    minHeap.insert(((0, 0, status[0][0])))       // y좌표, x좌표, 잃은 루피 크기

    while true {
        guard let (y, x, _) = minHeap.pop() else { return }

        if y == n-1 && x == n-1 { return }
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]

            /// 동굴 범위 내에 있고, 잃은 루피를 줄일 수 있는 경우 전진
            if (0..<n).contains(ny) && (0..<n).contains(nx) && status[ny][nx] > status[y][x] + map[ny][nx] {
                status[ny][nx] = status[y][x] + map[ny][nx]
                minHeap.insert((ny, nx, status[ny][nx]))
            }
        }
    }
}

// MARK: - BFS 방식
import Foundation

let dy = [0, 0, 1, -1]
let dx = [1, -1, 0, 0]

var i = 0
while true {
    let n = Int(readLine()!)!
    i += 1
    
    /// 종료 조건: 0이 입력되면 종료
    if n == 0 {
        break
    }
    
    /// 동굴 정보 저장
    var caves: [[Int]] = []
    for _ in 0..<n {
        let info = readLine()!.split(separator: " ").map{Int(String($0))!}
        caves.append(info)
    }
    
    /// 잃은 루피 상태 저장
    var rupeeStatus = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    rupeeStatus[0][0] = caves[0][0]
    
    bfs(n, &rupeeStatus, caves)
    print("Problem \(i): \(rupeeStatus[n-1][n-1])")
}

func bfs(_ n: Int, _ status: inout [[Int]], _ map: [[Int]]) {
    status[0][0] = map[0][0]
    var queue = [(0, 0)]
    var index = 0
    
    while index < queue.count {
        let (y, x) = queue[index]
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            /// 동굴 범위 내에 있고, 잃은 루피를 줄일 수 있는 경우 전진
            if (0..<n).contains(ny) && (0..<n).contains(nx) && status[ny][nx] > status[y][x] + map[ny][nx] {
                status[ny][nx] = status[y][x] + map[ny][nx]
                queue.append((ny, nx))
            }
            
        }
        
        index += 1
    }
}

