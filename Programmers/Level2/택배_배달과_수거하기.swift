import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var answer = 0
    var delivery = 0
    var pickUp = 0
    
    for i in stride(from: n-1, through: 0, by: -1) {
        // 둘 다 없는 경우 방문하지 않음
        if deliveries[i] == 0 && pickups[i] == 0 {
            continue
        }
        
        // 해당 집을 방문하는 횟수
        var visit = 0
        
        // 현재 택배 정보가
        while deliveries[i] > delivery || pickups[i] > pickUp {
            delivery += cap         // 최대 개수만큼 싣기
            pickUp += cap           // 최대 개수만큼 싣기
            visit += 1
        }
        
        // 현재 배달 가능한 상자 수 업데이트: 사용하고 남은 상자 수 -> 남은 상자수는 while문에서 다음 집에 사용
        delivery -= deliveries[i]
        pickUp -= pickups[i]
        
        // (총 거리) += (거리) * (들른 횟수) * 2
        answer += (i + 1) * visit * 2
    }
    
    return Int64(answer)
}
