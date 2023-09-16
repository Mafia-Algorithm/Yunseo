//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/09/16.
//

/// 둘만의 암호
/// 하나씩 순회하면서
/// index만큼 추가할 때 그 사이에 skip에 포함된 게 몇개인지 세기

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    // 모든 알파벳이 존재하는 배열 생성
    let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"
                    , "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    var alphabet2 = alphabet
    let skip = skip.map{String($0)}     // 건너 뛸 배열
    let s = s.map{String($0)}
    var result = ""
    
    // skip에 존재하는 알파벳 삭제
    for i in 0..<alphabet.count {
        if skip.contains(alphabet[i]) {
            alphabet2.remove(at: alphabet2.firstIndex(of: alphabet[i])!)
        }
    }
    
    // alphabet2를 기준으로 문자열 건너뛰기
    for char in s {
        result.append(alphabet2[((alphabet2.firstIndex(of: char)! + index) % alphabet2.count)])
    }
    
    return result
}
print(solution("aukks", "wbqd", 5))



// 실패한 풀이
//func solution(_ s:String, _ skip:String, _ index:Int) -> String {
//    let s = s.map{String($0)}
//    let skip = skip.map{String($0)}
//    var ascii: [Int] = []
//    var resultAscii: [Int] = []
//    var result = ""
//
//    // skip해야하는 알파벳 배열
//    for s in skip {
//        ascii.append(Int(UnicodeScalar(s)!.value))
//    }
//
//    for char in s {
//        var current = Int(UnicodeScalar(char)!.value)
//        for i in 1...index {
//            if ascii.contains(current + i) {
//                current += 1
//            }
//        }
//
//        if current + index > 122 {
//            resultAscii.append((current + index) % 122 + 96)
//            continue
//        }
//
//        resultAscii.append((current + index) % 122)
//
//    }
//
//    for r in resultAscii {
//        result.append(String(UnicodeScalar(r)!))
//    }
//
//    return result
//}
//
