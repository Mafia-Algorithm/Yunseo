// 2304 - 창고 다각형

import Foundation

let input = Int(readLine()!)!
var stick = [[Int]]()

for _ in 0..<input {
    stick.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 1. 기둥 순서대로 정렬
stick.sort{$0[0] < $1[0]}

var index = 0                       // 현재 기둥의 Index
var answer = 0                      // 창고 넓이
var flag = false                    // 현재 기둥보다 높은 다음 기둥이 있는지 여부
while index < stick.count {
    flag = false
    let nowStick = stick[index][0]  // 현재 기둥의 위치
    let nowH = stick[index][1]      // 현재 기둥의 높이
    
    var tempH = 0                   // 다음 기둥들 중 최대 높이
    var tempStick = index + 1       // 다음 기둥들 중 최대 높이의 위치, 초깃값: 현재 스틱 다음
    for i in tempStick..<stick.count {
        let nextStick = stick[i][0] // 다음 기둥의 위치
        let nextH = stick[i][1]     // 다음 기둥 높이
        
        if tempH < nextH {          // 다음 기둥들 중 가장 높은 경우 정보 업데이트
            tempH = nextH
            tempStick = i
        }
        
        if tempH >= nowH {                              // index 이후 기둥 높이가 index 기둥의 높이보다 높다면
            answer += (nextStick - nowStick) * nowH     // 넓이 더하기
            index = i                                   // 다음 기둥을 i로 업데이트
            flag = true
            break                           // for문 종료
        }
    }
    
    // 자기 자신보다 큰 기둥을 발견하지 못한 경우
    if !flag {
        answer += nowH                      // 자기 자신의 기둥만큼 더해줌
        index = tempStick                   // 위치를 다음 기둥들 중 가장 높았던 기둥으로 저장
        if index < stick.count {            // index가 마지막 기둥이었어서 tempStick의 초기값이 범위를 벗어났던 경우
            answer += (stick[tempStick][0] - nowStick - 1) * tempH  // 넓이 계산, 이미 자신의 기둥을 더했기 때문에 -1
        }
    }
    
}

print(answer)
