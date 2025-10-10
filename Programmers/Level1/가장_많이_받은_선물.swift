// 이번달까지 주고받은 기록 -> 다음달 예측

// 기록 O
// 선물 더 많이 준 사람이 다음달에 받음
// 기록 X or 주고받은 수 같음
// 선물 지수가 더 큰 사람이 받음

// 선물지수도 같음
// 다음달에 주고받지 않음

// 선물지수란?
// 이번달까지 친구들에게 준 선물 - 받은 선물

// 선물을 가장 많이 받을 친구가 받을 선물 수 궁금
// friends <= 50 (알파벳 소문자로 이루어짐, 10 이하, 동명이인 X)
// gifts <= 1만

// 1. 선물 주고받은 정보 어떻게 저장? 
/// [나: 선물지수]
/// [[A, B]: A가 준 선물 수]
// 2. 선물 지수 구하기
// 3. 바탕으로 1명이 다음 달에 받을 선물 개수 저장
// 4. 최대값 반환

import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    /// 선물지수
    var giftlog: [String: Int] = [:]
    friends.forEach {
        giftlog[$0, default: 0] = 0
    }
    
    /// 주고받은 선물 기록
    var history: [[String]: Int] = [:]
    for f1 in friends {
        for f2 in friends {
            if f1 == f2 { continue }
            history[[f1, f2], default: 0] = 0
        }
    }
    
    gifts.forEach {
        let info = $0.split(separator: " ").map{String($0)}
        let giver = info[0]
        let taker = info[1]
        
        /// 선물지수 계산
        giftlog[giver]! += 1
        giftlog[taker]! -= 1
        
        // 주고받은 선물 기록
        history[[giver, taker]]! += 1
    }
    
    // 다음달에 받는 선물 수
    var nextMonth: [String: Int] = [:]
    friends.forEach {
        nextMonth[$0, default: 0] = 0
    }
    
    for a in 0..<friends.count {
        for b in a+1..<friends.count {
            let aName = friends[a]
            let bName = friends[b]
            guard let AtoB = history[[aName, bName]],
                let BtoA = history[[bName, aName]] else {
                print("기록이 존재하지 않습니다.", aName, bName)
                continue
            }
            
            if AtoB > BtoA {                    // 선물 더 많이 준 사람이 다음 달에 받음
                nextMonth[aName]! += 1
            } else if AtoB < BtoA {
                nextMonth[bName]! += 1
            } else if AtoB == BtoA {            // 주고받은 개수 같거나 기록 없으면
                if giftlog[aName]! > giftlog[bName]! {  // 선물 지수가 더 큰 사람
                    nextMonth[aName]! += 1
                } else if giftlog[aName]! < giftlog[bName]! {
                    nextMonth[bName]! += 1
                }
            }
        }
    }  
    
    return nextMonth.values.max()!
}
