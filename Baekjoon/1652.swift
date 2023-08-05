//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/08/05.
//

//  1652 - 누울 자리를 찾아라

/// 1. 가로로 누울 수 있는 자리 찾기
/// 2. 세로로 누울 수 있는 자리 찾기
/// 주의할 점) X가 나온다고 바로 다음 케이스로 넘어가면 안됨. 장애물 뒤에 누울 자리가 있을수도 있기 때문

import Foundation

let input = Int(readLine()!)!
var info = [[String]]()

for _ in 0..<input {
    info.append(contentsOf: Array(arrayLiteral: readLine()!.map{String($0)}))
}

// 가로열
var count = 0
var rowCount = 0
for r in 0..<input {
    count = 0
    for c in 0..<input {
        if info[r][c] == "." {
            count += 1
        } else if info[r][c] == "X" {
            if count > 1 {
                rowCount += 1
            }
            count = 0
        }
    }
    if count > 1 {
        rowCount += 1
    }
}

var colCount = 0
for c in 0..<input {
    count = 0
    for r in 0..<input {
        if info[r][c] == "." {
            count += 1
        } else if info[r][c] == "X" {
            if count > 1 {
                colCount += 1
            }
            count = 0
        }
    }
    if count > 1 {
        colCount += 1
    }
}

print(rowCount, colCount)


/// 더 나은 풀이
///
/// 1. X를 기준으로 split해서 true, false를 나눔(X인 경우 false)
/// 2. false의 개수를 세서 배열에 저장
/// 3. false count를 저장한 배열에서 false count가 1이상이면 정답 증가
let n = Int(readLine()!)!
var arr = [[Bool]](), x = 0, y = 0
for _ in 0..<n {
    arr.append(readLine()!.map{$0 == "." ? true : false})
}
for i in 0..<n {
    let splitX = arr[i].split(separator: false).map{$0.count}
    let splitY = arr.map{$0[i]}.split(separator: false).map{$0.count}
    for i in splitX {
        if i >= 2 { x += 1 }
    }
    for i in splitY {
        if i >= 2 { y += 1 }
    }
}
print(x, y)

