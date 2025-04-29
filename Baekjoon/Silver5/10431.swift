// 10431 - 줄세우기

// 아무나 한 명을 뽑아 줄의 맨 앞에 세운다.
// 그 다음부터는 학생이 한 명씩 줄의 맨 뒤에 서면서 다음 과정을 거친다.
// 자기 앞에 자기보다 큰 학생이 없다면 그 자리에 서고 끝
// 큰 학생이 있다면 그중 가장 앞에 있는 학생의 바로 앞에 선다.
// A부터 그 뒤의 모든 학생은 한발씩 뒤로 물러선다.

// 학생들이 총 몇 번 물러서게 될까?
// 버블소트 직접 구현 !

import Foundation

let P = Int(readLine()!)!

for _ in 0..<P {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var stack: [Int] = []
    var remain: [Int] = []
    var index = 1
    var count = 0
    while index < input.count {
        let student = input[index]
        if stack.isEmpty {
            stack.append(student)
        } else {
            while !stack.isEmpty && stack.last! > student {
                remain.append(stack.popLast()!)
                count += 1
            }
            stack.append(student)
            stack += remain.reversed()
            remain.removeAll()
        }
        index += 1
    }
    
    print(input[0], count)
}

