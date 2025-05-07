import Foundation

let N = Int(readLine()!)!

var arrA = readLine()!.split(separator: " ").map{Int(String($0))!}
let arrB = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in 1..<N {
    var loc = i - 1
    let newItem = arrA[i]
    
    /// loc가 범위 내에 존재하고, arrA[loc]가 현재 타겟보다 큰 경우
    while loc >= 0 && arrA[loc] > newItem {
        arrA[loc+1] = arrA[loc]
        loc -= 1
        
        if compare(arrA, arrB) {
            print(1)
            exit(0)
        }
    }
    
    if loc != i - 1 {       // swap이 한 번이라도 일어났다면
        arrA[loc + 1] = newItem
        if compare(arrA, arrB) {
            print(1)
            exit(0)
        }
    }
}

func compare(_ a: [Int], _ b: [Int]) -> Bool {
    for i in 0..<a.count {
        if a[i] != b[i] {
            return false
        }
    }
    
    return true
}

print(0)

