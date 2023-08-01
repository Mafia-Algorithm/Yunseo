//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/08/01.
//
//  20301 - 타노스

import Foundation

var input: String = readLine()!

let zero = input.filter { $0 == "0" }.count
let one = input.filter { $0 == "1" }.count

var newS = ""
for _ in 0..<zero/2 {
    input.remove(at: input.lastIndex(of: "0")!)     // 사전 순이기 때문에 0은 가장 뒤에서부터 삭제
}

for _ in 0..<one/2 {
    input.remove(at: input.firstIndex(of: "1")!)    // 마찬가지로 1은 가장 앞에서부터 삭제
}

print(input)

