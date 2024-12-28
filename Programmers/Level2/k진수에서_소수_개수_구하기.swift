import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    // n을 k진수로 변환 후 0을 기준으로 나눔
    let numbers = String(n, radix: k).split(separator: "0").map{Int(String($0))!}
    
    func isPrime(_ target: Int) -> Bool {
        for i in 2...Int(sqrt(Double(target))) + 1 {
            if target % i == 0 && target != i {
                return false
            }
        }
        
        return true
    }
    
    var answer = 0
    for n in numbers {
        if n < 2 { continue }
        if isPrime(n) { answer += 1 }
    }
    
    return answer
}
