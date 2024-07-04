import Foundation

func solution(_ storey:Int) -> Int {
    var storey = storey
    
    var answer = 0
    while storey > 0 {
        let temp = storey % 10
        
        if temp > 5  {                            // 5보다 큰 경우 올림
            answer += (10 - temp)
            storey += 10                          // 10 더하고 10으로 나누면 버튼 횟수가 됨
        } else if temp == 5 {                     // 5인 경우 그 다음 숫자도 확인
            if (storey / 10) % 10 > 4 {           // 다음 숫자가 4보다 큰 경우 올리는 경우
                // 255 -> 265가되고 다음에 26이 되어 6번 클릭이 됨
                storey += 10                      
            }
            answer += temp
        } else if temp < 5 {                      // 5보다 작은 경우는 버튼 눌러서 내림
            answer += temp
        }
        storey /= 10
    }
    
    return answer + storey
}
