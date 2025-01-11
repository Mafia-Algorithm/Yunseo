import Foundation

var answer = 0
var primeNumber = Set<Int>()
var used = Array(repeating: false, count: 7)

// 만들 수 있는 숫자의 경우의 수
func combination(_ index: Int, _ length: Int, _ target: inout [String], _ numberList: [String]) {
    if target.count == length {
        primeNumber.insert(Int(target.joined())!)
        return
    }

    // 순서 상관없이 만들어야 함
    for i in 0..<numberList.count {
        if !used[i] {
            target.append(numberList[i])
            used[i] = true
            combination(i+1, length, &target, numberList)
            used[i] = false
        }
    }
}

// 소수인지 확인
func isPrime(_ target: Int) -> Bool {
    if target < 2 { return false }
    var i = 2
    while i * i <= target {
        if target % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map{String($0)}
    var target = [String]()
    
    // 만들 수 있는 모든 숫자 만들기
    for i in 1...numbers.count {
        combination(0, i, &target, numbers)
    }
    
    // 소수 개수 세기
    for num in primeNumber{
        if isPrime(num) { answer += 1 }
    }
    
    return answer
}
