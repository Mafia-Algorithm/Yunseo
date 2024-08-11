import Foundation

func solution(_ plans:[[String]]) -> [String] {
    var stopList = [Int]()
    var plans = plans.sorted(by: {$0[1] < $1[1]})       //plans 를 start 시간으로 정렬
    var planInfo = [[Int]]()
    var result = [String]()
    
    /// 시작시간과 과제 시간을 저장
    for p in 0..<plans.count {
        let time = plans[p][1].split(separator: ":").map{Int(String($0))!}
        let startTime = time[0] * 60 + time[1]
        planInfo.append([startTime, Int(plans[p][2])!])
    }
    
    var index = 0
    var now = planInfo[index][0]
    // 현재시간 + 과제 시간 > 다음 시작 시간 -> stopList에 넣어줌
    while index < plans.count {
        // 마지막 과제라면 완료
        if index == plans.count - 1 {
            result.append(plans[index][0])
            break
        }
        var endTime = now + planInfo[index][1]        // 과제가 끝나는 시간 = 현재시간 + 과제가 걸리는 시간
        if endTime <= planInfo[index+1][0] {          // 과제를 끝낼 수 있다면
            result.append(plans[index][0])            // 정답 배열에 추가
            now = endTime                               // 현재 시간 = 과제 끝난 시간
            
            // 멈춘 과제가 존재하고, 현재 시간이 다음 과제를 시작할 수 없는 시간인 경우
            while !stopList.isEmpty && now != planInfo[index+1][0] {
                let stopHomeWork = stopList.popLast()!                    // 가장 최근 과제 꺼냄
                let tempEndTime = now + planInfo[stopHomeWork][1]          // 멈춘 과제의 끝나는 시간 = 현재 시간 + 멈춘 과제의 수행 시간
                if tempEndTime <= planInfo[index+1][0] {       // 과제를 모두 수행할 수 있다면
                    result.append(plans[stopHomeWork][0])            // 정답 배열에 추가
                    now = tempEndTime                 // 현재 시간 = 과제 끝난 시간
                } else {                             // 과제를 모두 수행할 수 없다면
                    stopList.append(stopHomeWork)   // 다시 멈춘 과제에 넣기
                    now = planInfo[index+1][0]
                    planInfo[stopHomeWork][1] = tempEndTime - now   // 멈춘 과제의 잔여 시간 = 과제를 끝낼 수 있었던 시간 - 다음 과제 시작 시간
                }
            }
            if stopList.isEmpty {
                now = planInfo[index+1][0]
            }
        } else {                                    // 과제를 끝낼 수 없다면
            stopList.append(index)                  // 멈춘 과제 리스트에 추가
            planInfo[index][1] = endTime - planInfo[index+1][0]                    // 잔여 과제 시간 = 현재 시간 - 다음 과제 시작 시간
            now = planInfo[index+1][0]
        }
        index += 1
    }
    
    while !stopList.isEmpty {
        result.append(plans[stopList.popLast()!][0])
    }
    
    return result
}
