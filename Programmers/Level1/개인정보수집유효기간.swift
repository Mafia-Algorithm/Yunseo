//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2023/09/17.
//

/// 개인정보 수집 유효기간
import Foundation

// 모든 달은 28일까지 있다고 가정

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termsList = [String: Int]()                     // 약관: 유효기간 딕셔너리로 저장
    var result = [Int]()                                  // 결과를 담는 배열
    let today = today.split(separator: ".").map{Int(String($0))!}
    
    // 약관에 따른 유효기간 딕셔너리에 저장
    for t in terms {
        let temp = t.split(separator: " ").map{String($0)}
        termsList[temp[0]] = Int(temp[1])!
    }
    
    for i in 0..<privacies.count {
        let info = privacies[i].split(separator: " ").map{String($0)}       // 현재 확인할 개인정보
        let time = termsList[info[1]]!                     // 약관의 유효기간
        
        let Date = info[0].split(separator: ".").map{Int(String($0))!}
        var expireYear = Date[0]
        var expireMonth = Date[1] + time                    // 약관 시작일 + 유효기간
        var expireDay = Date[2]

        // 2019년 12월 1일, 한 달 -> 2019, 12월 28일
        if expireDay == 1 {                                 // 현재 1일이면 28일로 변경
            expireDay = 28
            expireMonth -= 1                                // 28일은 전월이므로 월도 하나 감소
        } else {
            expireDay -= 1
        }
        
        // 만료달이 12보다 클 때
        if expireMonth > 12 {
            if expireMonth % 12 == 0 {                      // 유효기간 계산이 12보다 크고 12의 배수일 때
                expireYear += expireMonth / 12 - 1          // 유효기간이 12라 12+12=24가 된 경우, 몫보다 1작아야 함
                expireMonth = 12                            // 12의 배수이므로 년도를 올리고 월은 그래도 12
            } else {                                        // 12보다 커서 년도도 바뀌지만 12의 배수가 아닌 경우
                expireYear += expireMonth / 12              // 년도는 나눈 몫만큼 증가
                expireMonth %= 12                           // 월은 12를 나눈 나머지만큼 증가
            }
        }
        
        if expireYear > today[0] {                          // 년도끼리 비교, 유효기간이 더 크면 만료하지 않음
            continue
        } else if expireYear >= today[0] && expireMonth > today[1] {    // 년도는 크거나 같고 월도 크면 만료X
            continue
        } else if expireYear >= today[0] && expireMonth >= today[1] && expireDay >= today[2] { 
            continue
        } else { result.append(i+1) }
    }
    return result
}
//print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))
//2021.11.01
//2022.06.28
//2022.05.18
//2022.05.19
print(solution("2011.12.18", ["A 13"], ["2001.01.01 A", "2010.11.28 A"]))
//2002.01.28
//2011.12.27
print(solution("2020.12.17", ["A 12"], ["2010.01.01 A", "2019.12.17 A"]))
// 2011.12.28
// 2020.12.16

