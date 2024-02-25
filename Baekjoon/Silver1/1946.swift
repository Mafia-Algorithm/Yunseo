// 1946 - 신입사원

/// 서류와 면접 중 적어도 하나가 다른 지원자보다 떨어지지 않으면 됨. -> 두 개다 떨어지면 안됨

import Foundation

/// File 입출력
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let file = FileIO()
var TC = file.readInt()

for _ in 0..<TC {
    let person = file.readInt()
    var newPerson = [(Int, Int)]()
    for _ in 1...person {
        newPerson.append((file.readInt(), file.readInt()))
    }
    newPerson.sort{$0.0 < $1.0}
    
    var answer = 0
    var min = newPerson[0].1
    for i in 1..<person {
        if newPerson[i].1 < min {
            answer += 1
            min = newPerson[i].1
        }
    }
    print(answer + 1)
}

