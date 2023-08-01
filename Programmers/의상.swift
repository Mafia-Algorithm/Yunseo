//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/08/01.
//
//  프로그래머스 - 의상

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesInfo = [String: [String]]()
    var result = 1
    for i in 0..<clothes.count {
        if clothesInfo[clothes[i][1]] == nil {
            clothesInfo[clothes[i][1]] = [clothes[i][0]]
        } else {
            clothesInfo[clothes[i][1]]?.append(clothes[i][0])
        }
    }
    
    for j in clothesInfo {
        result *= (j.value.count + 1)
    }
    return result-1
}

