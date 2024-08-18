import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var percent = [10, 20, 30, 40]
    var sale = Array(repeating: 0, count: emoticons.count)
    var answer = [0, 0]
    
    func dfs(_ depth: Int) {
        if depth == emoticons.count {       // 할인율 계산이 완료되면
            
            var subscriber = 0              // 해당 할인율일 때 구독자 수
            var money = 0                   // 해당 할인율일 때 돈
            
            users.forEach { u in
                var total = 0               // 이 유저가 구매하는 이모티콘 금액
                zip(sale, emoticons).forEach{
                    if $0.0 >= u[0] {
                        total += $0.1 * (100 - $0.0) / 100
                    }
                }
                if total >= u[1] {
                    subscriber += 1
                    total = 0
                } else {
                    money += total
                }
            }
            
            if answer[0] < subscriber {
                answer[0] = subscriber
                answer[1] = money
            } else if answer[0] == subscriber && answer[1] < money {
                answer[1] = money    
            }
            
            return
        }
        
        // 나올 수 있는 모든 할인율
        percent.forEach {
            sale[depth] = $0
            dfs(depth + 1)
        }
    }
    
    dfs(0)
    
    return answer
}
