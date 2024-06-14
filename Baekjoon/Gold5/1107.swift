import Foundation

// 시간 복잡도: 60만 * 6
let channel = Int(readLine()!)!
let wrong = Int(readLine()!)!

// 사용할 수 없는 숫자
var wrongNums: [Int] = []
if wrong > 0 {
    wrongNums = readLine()!.split(separator: " ").map{Int(String($0))!}
}

var answer = abs(channel - 100)         // +, -로만 이동하는 경우

for i in 0...999999 {
    var flag = true                     // 입력할 수 있는 숫자인지 여부
    let arrayNum = String(i).map{Int(String($0))!}  // 채널의 배열 버전
    
    for j in arrayNum {       // 채널의 숫자 개수
        if wrongNums.contains(j) {      // 만약 사용할 수 없는 숫자가 있다면
            flag = false
            break
        }
    }
    
    // 만들 수 있는 채널이라면
    if flag {
        // 현재 채널로 이동 후 +, -를 사용하는 방법과 비교
        answer = min(answer, abs(channel - i) + arrayNum.count)
    }
}

print(answer)

