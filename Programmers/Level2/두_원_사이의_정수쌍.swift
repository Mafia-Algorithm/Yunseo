import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var count = 0.0
    
    for i in 1...r2 {
        // 큰 원의 y좌표이다. 반지름의 길이가 5일 때 4.8579도 어쨌든 4까지만 가능하므로 floor 사용
        let yCeil = floor(sqrt(pow(Double(r2), 2) - pow(Double(i), 2)))
        // 작은 원의 y좌표이다. 반지름보다 x좌표가 크면 1사분면 기준으로 피타고라스 정리 사용할 수 없음
        // 반지름이 3일 때 y = 3.2311인 경우도 가능하므로 ceil로 처리
        let yFloor = r1 - i > 0 ? ceil(sqrt(pow(Double(r1), 2) - pow(Double(i), 2))) : 0
        
        // yCeil과 yFloor도 포함해야하기 때문에 아래와 같이 식 작성
        count += (yCeil - (yFloor - 1))
    }
    return Int64(count*4)
}
print(solution(2, 3))
