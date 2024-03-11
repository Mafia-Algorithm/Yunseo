// 1080 - 행렬

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]            // y
let M = input[1]            // x

// 행렬 저장하기
var A = [[Int]]()
var B = [[Int]]()

for _ in 0..<N {
    A.append(readLine()!.map{Int(String($0))!})
}

for _ in 0..<N {
    B.append(readLine()!.map{Int(String($0))!})
}

if A == B {
    print(0)
    exit(0)
}

// 크기가 3 * 3이 안돼서 뒤바꿀 수 없는 경우
if N < 3 || M < 3 {
    print(-1)
    exit(0)
}

var count = 0
var flag = false
for i in 0..<N-2 {
    for j in 0..<M-2 {
        if A[i][j] != B[i][j] {
            swapAB(i, j)
            count += 1
        }
        
        if A == B {
            print(count)
            exit(0)
        }
    }
}

print(-1)

// 3 * 3 행렬 뒤바꾸기
func swapAB(_ y: Int, _ x: Int) {
    for i in y..<y+3 {
        for j in x..<x+3 {
            A[i][j] = A[i][j] == 1 ? 0 : 1
        }
    }
}
