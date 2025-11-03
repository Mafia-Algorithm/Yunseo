
    var maxPlace = 0                    // 등장 위치
    var index = 0                       // plugState에서 뽑을 콘센트 위치
    
    for i in 0..<plugState.count {      // 현재 꽂힌 콘센트 확인
        let item = plugState[i]
        
        if itemTime[item].isEmpty {     // 다시 등장하지 않는 아이템
            index = i
            break
        }
        
        if maxPlace < itemTime[item][0] {
            index = i
            maxPlace = itemTime[item][0]
        }
    }
    plugState[index] = next
    unPlugCount += 1
}


// 초기 세팅
var plugState = Array(repeating: 0, count: n)
var i = 0
while plugState.contains(0) && i < electricItem.count {               // 플러그가 비어있을 때 까지 새 콘센트 꼽기
    let current = electricItem[i]
    itemTime[electricItem[i]].removeFirst()
    
    if !plugSta// 1700 - 멀티탭 스케줄링
// 그 뒤로 안나오는 전자기기의 플러그를 빼는 것이 좋음

// 1. 콘센트에 플러그를 모두 꽂음
// 2. n + 1부터 어떤 것을 뺄지 설정
// 3. 가장 늦게 나오는 것을 찾기

/// k, electricItem이 나타내는 의미 잘 구분해야 했음
/// k = 사용할 수 있는 전자기기 개수(10인 경우 10개의 전자기기 사용 가능)
/// electricItem: 실제 콘센트를 꽂는 전자기기 나열
/// electricItem.count: 실제 사용 횟수

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let k = input[1]

let electricItem = readLine()!.split(separator: " ").map{Int(String($0))!}

// 전기 용품 등장 위치 저장
var itemTime = Array(repeating: [Int](), count: k + 1)
electricItem.enumerated().forEach { (i, v) in
    itemTime[v].append(i)
}

/// 콘센트 크기가 사용횟수보다 크다면 뺄 일 없음
if n >= electricItem.count {
    print(0)
    exit(0)
}

var unPlugCount = 0
func unPlug(_ next: Int) {te.contains(current) {
        plugState[plugState.firstIndex(of: 0)!] = current
    }
    i += 1
}

for index in i..<electricItem.count {
    let current = electricItem[index]
    itemTime[current].removeFirst()
    if plugState.contains(current) { continue }
    unPlug(current)
}

print(unPlugCount)

