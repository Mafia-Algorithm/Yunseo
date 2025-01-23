import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var s: Set<Int> = [x]
    var answer = 0
    while !s.isEmpty {
        /// set에 정답이 존재한다면
        if s.contains(y) {
            return answer
        }
        var temp: Set<Int> = []
        for number in s {
            if number + n <= y {
                temp.insert(number + n)
            }
            if number * 2 <= y {
                temp.insert(number * 2)
            }
            if number * 3 <= y {
                temp.insert(number * 3)
            }
        }
        s = temp
        answer += 1
    }
    
    return -1
}
