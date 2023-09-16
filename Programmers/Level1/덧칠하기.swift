//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/09/10.
//
/// 덧칠하기

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section = section
    var result = 0
    
    var idx = 0
    while !section.isEmpty {
        idx = section.removeFirst()
        let area = idx + m - 1
        section = section.filter{ $0 > area }
        result += 1
    }
    
    return result
}

print(solution(8, 4, [2, 3, 6]))

// 시간초과 풀이
import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section = section
    var result = 0
    
    var idx = 0
    while idx < section.count {
        let area = section[idx] + m - 1
        result += 1
        idx = section.firstIndex(where: { $0 > area }) ?? section.count
    }
    
    return result
}

