// 2075 - N번째 큰 수
// 모든 수는 자신의 한 칸 위에 있는 수보다 크다.
// 1500 * 1500 = 2,250,000 ~= 200만
// log200만 ~= 21
// O(N^2logN^2) 가능

// Int64는 -Int32 ~ Int32
// 2^32 ~= 1024 ^ 3 ~= 1,000,000,000 ~= 10억

// 메모리 관점 -> 메모리 초과
// 200만 * 8byte ~= 18MB
// 최소힙으로 N개로 제한
// peek가 새로운 수보다 작을 때만 추가

import Foundation

final class FileIO {
    private let bufferSize = 1 << 16
    private var buffer = [UInt8]()
    private var index = 0
    private var size = 0

    init() {
        buffer = [UInt8](repeating: 0, count: bufferSize)
    }

    @inline(__always) private func read() -> UInt8 {
        if index == size {
            // fread를 위해 stdin을 명시적으로 사용
            size = fread(&buffer, 1, bufferSize, stdin)
            if size == 0 { return 0 }
            index = 0
        }
        let result = buffer[index]
        index += 1
        return result
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }
        return sum * (isPositive ? 1 : -1)
    }
}

struct MinHeap {
    var elements: [Int] = []

    var count: Int { elements.count }
    var peek: Int { elements[0] }

    mutating func insert(_ value: Int) {
        elements.append(value)
        shiftUp(elements.count - 1)
    }

    // 루트 노드를 교체하고 내려보내는 최적화 함수
    mutating func replace(with value: Int) {
        elements[0] = value
        shiftDown(0)
    }

    private mutating func shiftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func shiftDown(_ index: Int) {
        var parent = index
        while true {
            let left = parent * 2 + 1
            let right = parent * 2 + 2
            var candidate = parent

            if left < elements.count && elements[left] < elements[candidate] {
                candidate = left
            }
            if right < elements.count && elements[right] < elements[candidate] {
                candidate = right
            }
            if candidate == parent { break }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

let fIO = FileIO()
let n = fIO.readInt()
var minHeap = MinHeap()

for _ in 0..<n * n {
    let num = fIO.readInt()
    
    if minHeap.count < n {
        minHeap.insert(num)
    } else {
        // 현재 힙의 최솟값보다 큰 수가 들어올 때만 교체
        // 최소값은 이제 필요 없기 때문
        if num > minHeap.peek {
            minHeap.replace(with: num)
        }
    }
}

print(minHeap.peek)

