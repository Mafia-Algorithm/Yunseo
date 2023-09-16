//
//  공원산책.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/09/09.
//
/// 1. S에서 시작
/// 2. 이동할 때 장애물 만나면 그 명령 무시
/// 3. 범위 내 있는지 확인

import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var parkMap = [[String]]()
    var result: [Int] = []
    
    func checkRange(_ move: Int, _ direction: String) -> [Int] {
        var current = result
        let dx = [1, -1, 0, 0]
        let dy = [0, 0, 1, -1]
        let ewsn = ["E", "W", "S", "N"]
        
        let i = ewsn.firstIndex(of: direction)!
        
        for _ in 1...move {
            let nextX = current[1] + dx[i]
            let nextY = current[0] + dy[i]
            
            if 0 <= nextX && nextX < parkMap[0].count && 0 <= nextY && nextY <= parkMap.count && parkMap[nextY][nextX] != "X" {
                current[0] = nextY
                current[1] = nextX
            } else {
                return result
            }
        }
        return current
    }
    
    // 공원 정보 저장
    for p in park {
        parkMap.append(p.map{String($0)})
    }
    
    // 시작 위치 찾기
    for i in 0..<parkMap.count {
        if parkMap[i].contains("S") {
            result.append(i)
        }
        for j in 0..<parkMap[i].count {
            if parkMap[i][j] == "S" {
                result.append(j)
            }
        }
    }
    
    // 경로 확인
    for r in routes {
        let info = r.split(separator: " ").map{String($0)}
        result = checkRange(Int(info[1])!, info[0])
    }
    return result
}

print(solution(["OOO", "OSO", "OOO", "OOO"], ["N 2", "S 2"]))

