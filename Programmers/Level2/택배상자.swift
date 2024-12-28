import Foundation

// 방법1) 하나씩 컨테이너에서 내림.
// 서브 컨테이너에서 뺄 수 있는 상자를 다 뺌.
// 이후 벨트에서 내려놓는 상자를 확인
func solution(_ order:[Int]) -> Int {
    var subContainer = [Int]()      // 서브 컨테이너
    var orderIndex = 0              // 넣을 택배 상자
    var answer = 0
    var i = 1                       // 내려놓을 택배 상자
    
    // 상자 1부터 N까지 벨트에서 내림
    while i <= order.count {
        let orderBox = order[orderIndex]        // 트럭에 넣어야하는 상자
        
        // 서브컨테이너 박스 == 실어야하는 박스라면, 서브 컨테이너에서만 뺌
        if !subContainer.isEmpty && orderBox == subContainer.last! { 
            answer += 1
            orderIndex += 1
            _ = subContainer.popLast()!
            continue
        }
        
        // 트럭에 넣어햐나는 상자 == 내릴 택배 상자
        if orderBox == i {
            answer += 1
            orderIndex += 1 
        } else {        // 서브에도 없고 내릴 상자도 아닌 경우 서브에 넣음
            subContainer.append(i)
        }
        
        i += 1          // 다음 상자 벨트에서 내림
    }
    
    // 상자를 다 내린 이후
    // 서브 컨테이너만 확인
    while orderIndex < order.count {
        let orderBox = order[orderIndex]
        if !subContainer.isEmpty && subContainer.last! == orderBox {
            answer += 1
            _ = subContainer.popLast()!
            orderIndex += 1
        } else {        // 서브컨테이너 마지막에 없는 경우 -> 종료
            break
        }
    }
    
    return answer
}
