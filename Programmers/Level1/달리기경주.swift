//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/09/06.
//

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    let callings = callings
    var playersDict: [String:Int] = [:]

    // 딕셔너리 초기화
    for i in 0..<players.count {
        playersDict[players[i]] = i
    }

    for name in callings {
        let index = playersDict[name]!              // 불린 사람의 등수
        let front = players[index-1]                // 앞 사람의 이름
        players.swapAt(index, index-1)
        playersDict[front]! += 1                    // 앞 사람 등수 내리기
        playersDict[name]! -= 1                     // 불린 사람 등수 올리기
        
    }

    return players
}

