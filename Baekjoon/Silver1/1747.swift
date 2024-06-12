import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: true, count: 1003002)
var primes = [String]()

for i in 2...1003001 {
    if arr[i] == true {         // 소수인 경우
        for j in stride(from: i, through: 1003001, by: i) {         // 해당 소수의 배수는 모두 소수가 아니다
            arr[j] = false
        }
        primes.append(String(i))
    }
}

for i in primes {
    if Int(i)! >= n && i == String(i.reversed()) {
        print(i)
        break
    }
}
