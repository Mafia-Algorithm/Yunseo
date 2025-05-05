// 15961 - 회전초밥

// 같은 종류의 초밥이 둘 이상 있을 수 있다.
// k개를 연속해서 먹을 경우 할인된 정액 가격으로 제공
// 초밥 종류 하나가 쓰인 쿠폰을 발행하고 행사에 참가할 경우 쿠폰에 적힌 초밥을 하나 무료 제공
// 벨트에 초밥이 없을 경우 요리사가 새로 만들어 손님에게 제공

import Foundation

/// https://gist.github.com/JCSooHwanCho/30be4b669321e7a135b84a1e9b075f88 fileIO를 사용한 입력
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fIO = FileIO()
let input = [fIO.readInt(), fIO.readInt(), fIO.readInt(), fIO.readInt()]
let N = input[0], d = input[1], k = input[2], c = input[3]

var sushi: [Int] = []

for _ in 0..<N {
    let number = fIO.readInt()
    
    sushi.append(number)
}

var left = 0
var right = 0

var sushiDict: [Int: Int] = [:]         // 스시 종류: 개수
_ = sushi[0..<k].map{sushiDict[$0, default: 0] += 1}
sushiDict[c, default: 0] += 1           // 스시 쿠폰 사용
var kindCount = sushiDict.count         // 스시 종류

var tempCount = 0
for i in 0..<N {
    left = i
    right = (i + k) % N
    
    let delete = sushi[left]
    let add = sushi[right]
    
    // 초밥 제거
    sushiDict[delete]! -= 1
    if sushiDict[delete]! == 0 {
        sushiDict[delete] = nil
    }
    
    // 새 초밥 추가
    sushiDict[add, default: 0] += 1
    
    if kindCount < sushiDict.count {    // 스시 종류가 더 많으면 업데이트
        kindCount = sushiDict.count
    }
}

print(kindCount)

