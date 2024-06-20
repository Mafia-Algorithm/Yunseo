// 14719 - 빗물

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let stick = readLine()!.split(separator: " ").map{Int(String($0))!}

var index = 0
var answer = 0
var flag = false
while index < stick.count {
    flag = false
    
    let nowH = stick[index]
    var tempH = 0
    var tempStick = index + 1
    
    // 1. 현재 기둥과 다음 기둥의 높이 비교
    for i in index + 1..<stick.count {
        
        if tempH < stick[i] {               // 현재 기둥의 다음 기둥의 최대 높이 정보 저장
            tempH = stick[i]
            tempStick = i
        }
        
        if nowH < tempH {                   // 현재 기둥보다 다음 기둥이 높은 경우
            answer += nowH * (i - index)    // (높은 기둥의 위치 - 현재 기둥의 위치) * 현재 기둥의 높이
            index = i                       // 높은 기둥의 위치로 인덱스 업데이트
            flag = true                     // 현재 기둥보다 높은 기둥이 존재하는지 여부
            break
        }
    }
    if !flag {                              // 현재 기둥보다 높은 기둥이 없는 경우
        answer += nowH                      // 현재 기둥의 높이만큼 더함
        answer += (tempStick-index-1) * tempH               // nowH를 이미 더했기 때문에 1을 빼야 함
        index  = tempStick                  // 다음 기둥 중 가장 높은 기둥의 위치로 업데이트
    }
}

// 2. 기둥 면적 제거
for s in stick {
    answer -= s
}

print(answer)
