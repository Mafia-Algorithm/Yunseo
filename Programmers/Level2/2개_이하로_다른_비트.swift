// f(x) = x보다 크고, x와 비트가 1~2개 다른 수 중에서 제일 작은 수

// 끝자리가 0일 때 -> 그냥 1로 변경
// 끝자리가 1일 때
// 그 다음자리가 1이면 0이 나올 때까지 찾기
// 그 다음자리가 0이면 다음자리를 1로, 현재자리를 0으로 변경

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    
    func findF(_ bit: [String]) -> Int64 {
        var index = bit.count - 1
        var bit = ["0"] + bit
        
        if bit.last! == "0" {
            bit.popLast()!
            bit.append("1")
            return Int64(bit.joined(), radix: 2)!
        }
        
        while index >= 0 {
            if bit[index] == "0" {
                bit[index] = "1"
                bit[index+1] = "0"
                break
            }
            index -= 1
        }
        return Int64(bit.joined(), radix: 2)!
    }

    var answer = [Int64]()
    for num in numbers {
        answer.append(findF(String(num, radix: 2).map{String($0)}))
    }
    
    return answer
}

// 다른 사람의 풀이
func solution(_ numbers: [Int64]) -> [Int64] {
    return numbers.map(f)
}

func f(_ number: Int64) -> Int64 {
    return (number | ~number & (number + 1)) & ~((~number & (number + 1)) >> 1)
}


