// 24501 - 알고리즘 수업 - 삽입 정렬 1

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]

var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = 0

for i in 1..<N {
    var loc = i - 1
    let newItem = arr[i]
    
    while (loc >= 0 && arr[loc] > newItem) {
        arr[loc + 1] = arr[loc]
        loc -= 1
        count += 1
        if count == K {
            print(arr[loc + 1])
            exit(0)
        }
    }
    
    if loc != i - 1 {
        arr[loc + 1] = newItem
        count += 1
        if count == K {
            print(arr[loc + 1])
            exit(0)
        }
    }
}

print(-1)

