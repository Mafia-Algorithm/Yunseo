// 16926 - 배열 돌리기1 50분 시작


// 1. 배열을 1차원으로 그룹지어 만든다.
// 2. 회전해야하는 만큼 1차원 배열을 가공한다.
// 3. 재조립한다.
// 4. 출력한다.


import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var R = input[2]

// 주어진 배열
var array = [[Int]]()
for _ in 0..<N {
    array.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 그룹의 수
let depth = min(N, M) / 2

func rotate() {
    for d in 0..<depth {
        var group = [Int]()
        let maxN = N-d-1
        let maxM = M-d-1
        
        // 1. 1차원 배열 만들기
        group.append(contentsOf: array[d][d...maxM])
        
        for i in d+1..<maxN {
            group.append(array[i][maxM])
        }
        
        group.append(contentsOf: array[maxN][d...maxM].reversed())
        
        for i in (d+1..<maxN).reversed() {
            group.append(array[i][d])
        }
        
        // 2. 회전하기: 회전수 = R % 배열의 크기(한 바퀴 돌리면 처음과 같으므로)
        group = Array(group[R % group.count...group.count-1]) + Array(group[0..<R % group.count])
        
        // 3. 재조립한다.
        var index = 0
        for i in d..<maxM {
            array[d][i] = group[index]
            index += 1
        }
        
        for i in d..<maxN {
            array[i][maxM] = group[index]
            index += 1
        }
        
        for i in (d...maxM).reversed() {                // 마지막 줄
            array[maxN][i] = group[index]
            index += 1
        }
        
        for i in (d+1..<maxN).reversed() {
            array[i][d] = group[index]
            index += 1
        }
    }
}

rotate()

array.forEach{
    print($0.map{String($0)}.joined(separator: " "))
}
