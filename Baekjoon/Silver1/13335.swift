import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let w = input[1]
let L = input[2]

let truckList = readLine()!.split(separator: " ").map{Int(String($0))!}
var queue = [Int]()
queue.append(truckList[0])

var time = 1
var index = 1
while index < truckList.count {
    if queue.count == w {                       // 현재 다리 위 트럭 개수가 w개 라면
        queue.removeFirst()                     // 트럭 하나 내림
    }
    
    let truck = queue.reduce(0, +)              // 다리 위 트럭 무게
    
    if truck + truckList[index] <= L {        // 하나를 더 추가할 수 있다면
        queue.append(truckList[index])      // 다리에 트럭 올리기
        index += 1                              // 다음 트럭 가리키기
    } else {                                    // 더 추가할 수 없다면
        queue.append(0)                       // 허수 추가
    }
    
    time += 1                                   // 시간 증가
}

print(time + w)
