// 5073 - 삼각형과 세 변

import Foundation

while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let first = input[0], second = input[1], third = input[2]
    let max = max(first, second, third)
    
    if first == 0 && second == 0 && third == 0 {
        break
    }
    
    if first + second + third - max <= max {
        print("Invalid")
    } else if first == second && second == third {
        print("Equilateral")
    } else if first != second && first != third && second != third {
        print("Scalene")
    } else {
        print("Isosceles")
    }
}

