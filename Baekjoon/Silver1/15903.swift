import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]

var number = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted{$0 > $1}

for _ in 0..<m {
    let a = number.popLast()!
    let b = number.popLast()!
    
    number.append(a + b)
    number.append(a + b)
    
    number = number.sorted{$0 > $1}
}

print(number.reduce(0, +))
