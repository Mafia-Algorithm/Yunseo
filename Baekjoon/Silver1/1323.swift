// 1323 - 효율적인 해킹

// 신뢰관계, 컴퓨터 연결 -> 그래프 탐색이다!
// N, M <= 100000

import Foundation

struct Queue<T> {
    var pushStack = [T]()
    var popStack = [T]()
    var isEmpty: Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
    var count: Int {
        return pushStack.count + popStack.count
    }
    
    mutating func enqueue(_ element: T) {
        pushStack.append(element)
    }
    
    mutating func dequeue() -> T? {
        if popStack.isEmpty {
            while let popped = pushStack.popLast() {
                popStack.append(popped)
            }
        }
        return popStack.popLast()
    }
}


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var computers = [[Int]]()
for _ in 0..<n+1 {
    computers.append([])
}

var maxCount = Int.min
var hack: [Int] = Array(repeating: 0, count: n+1)

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int($0)! }
    computers[temp[1]].append(temp[0])
}

for i in 1..<n+1 {
    bfs(i)
    maxCount = max(maxCount, Int(hack[i]))
}

for i in 0..<hack.count where hack[i] == maxCount {
    print("\(i)", terminator: " ")
}


func bfs(_ start: Int) {
    var visited = Array(repeating: false, count: n+1)
    var queue = Queue<Int>()
    visited[start] = true
    
    for child in computers[start] {
        if !visited[child] {
            queue.enqueue(child)
            hack[start] += 1
            visited[child] = true
        }
    }
    
    while let dequeued = queue.dequeue() {
        for child in computers[dequeued] {
            if !visited[child] {
                queue.enqueue(child)
                hack[start] += 1
                visited[child] = true
            }
        }
    }
}
