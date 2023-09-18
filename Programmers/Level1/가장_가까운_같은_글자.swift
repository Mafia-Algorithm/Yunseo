//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/09/18.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var s = s.map{String($0)}
    var result = Array(repeating: 0, count: s.count)
    var sDict = [String: Int]()

    // 값을 저장하는 사전 생성
    for char in s {
        sDict[char] = 0
    }
    
    // 문자열 순회
    for i in 0..<s.count {
        for j in sDict {
            if sDict[j.key] != 0 {          // 사전 값이 0이 아님 == 방문한 적 있음
                sDict[j.key]! += 1
            }
        }
        if sDict[s[i]]! == 0 {              // 방문한 적이 없다면
            result[i] = -1                  // 정답 배열에 -1 넣음
            sDict[s[i]]! += 1               // 인덱스 += 1
        } else if sDict[s[i]] != 0 {      // 방문한 적이 있다면
            result[i] = sDict[s[i]]! - 1    // 자기 자신의 위치부터 1을 세기 때문에 -1한 값을 정답배열에 넣어줌
            sDict[s[i]] = 1                 // 다시 1로 초기화, 1로 하는 이유는 방문한 적이 있음을 나타내기 위함
        }
    }

    return result
}

/// 다른 사람의 풀이
import Foundation

func solution(_ s: String) -> [Int] {
    var word: [String: Int] = [:]
    var result: [Int] = []

    // 배열로 만들어서 인덱스, 문자열 값으로 저장
    for (index, val) in Array(s).map { String($0) }.enumerated() {
        if let beforeIndex = word[val] {                    // 처음 보는 알파벳이 아닌 경우
            result.append(index - beforeIndex)              // beforeIndex: 가장 최근 알파벳 위치, index: 현재 index
        } else {
            result.append(-1)                               // 처음 보는 알파벳인 경우
        }

        word[val] = index                                   // 알파벳의 가장 최근 위치 업데이트
    }

    return result
}

