// 차량별 주차요금 계산

// [차량 번호: [입차 시간, 출차 시간, 입차 시간,,,]]
// 1. 차 별로 순회
// - 전체 누적 시간 확인
// - 누적 시간이 기본 시간을 이하라면 기본 요금 청구
// - 초과인 경우 초과한 시간만큼 요금 청구

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let base = fees[0], defaultFee = fees[1], unitTime = fees[2], unitFee = fees[3]
    var carInfo: [String: [(String, String)]] = [:]
    
    records.forEach {
        let info = $0.split(separator: " ").map{String($0)}
        carInfo[info[1], default: []].append((info[0], info[2]))
    }
    
    var answer: [Int] = []
    var sortedInfo = carInfo.sorted{ $0.key < $1.key }
    
    for car in sortedInfo {         // 모든 차의 입출 정보 순회
        var times = 0               // 누적 시간
        var interTime = 0
        var carState = false        // 주차 중
        for timeInfo in car.value {        
            let time = timeInfo.0.split(separator: ":").map{Int(String($0))!}
            if timeInfo.1 == "IN" {
                interTime = time[0] * 60 + time[1]
                carState = true
            } else if timeInfo.1 == "OUT" {
                times += (time[0] * 60 + time[1] - interTime)
                interTime = 0
                carState = false
            }
        }
        if carState {
            times += (23 * 60 + 59 - interTime)
        }
        
        if times <= base { answer.append(defaultFee) }
        else { 
            var fee = ((times - base) / unitTime) * unitFee
            if (times - base) % unitTime > 0 { fee += unitFee }
            answer.append(fee + defaultFee)
        }
    }
    
    return answer
}
