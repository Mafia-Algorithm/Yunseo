import Foundation

func solution(_ numbers:String) -> Int {
    var nums = numbers.map{Int(String($0))!}
    var candidate = Set<Int>()
    
    // 종이 조각으로 만들 수 있는 모든 숫자 구하기(조합)
    func combination(_ temp: inout [Int], _ count: Int, _ used: inout [Bool]) {
        if temp.count == count {
            candidate.insert(Int(temp.map{String($0)}.joined())!)
            return
        }
        
        for i in 0..<nums.count {
            if !used[i] {
                temp.append(nums[i])
                used[i] = true
                combination(&temp, count, &used)
                used[i] = false
                _ = temp.removeLast()
            }
        }
    }
    
    var used = Array(repeating: false, count: nums.count)
    for i in 1...nums.count {
        var temp: [Int] = []
        combination(&temp, i, &used)
    }
    
    // prime 숫자 구하기
    let maxNum = candidate.max()!
    var isPrime = Array(repeating: true, count: maxNum + 1)
    isPrime[0] = false
    isPrime[1] = false
    
    if maxNum > 3 {
        for i in 2...Int(sqrt(Double(maxNum))) {
            for j in 2...(maxNum / i) {
                isPrime[i*j] = false
            }
        }
    }
    
    var answer = 0
    for c in candidate {
        if isPrime[c] { answer += 1 }
    }
    
    return answer
}
