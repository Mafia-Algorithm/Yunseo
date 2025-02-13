import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var server = Array(repeating: 0, count: 24)     // 증설 횟수
    
    var serverCount = 0
    for (i, p) in players.enumerated() {
        if i >= k {                           // k시간이 지난 서버 반납
            serverCount -= server[i-k]
        }
        
        var needs = 0                         // 지금 필요한 서버 개수
        if p / m > 0 {
            needs = p / m
        }
        
        if needs > serverCount {
            server[i] = needs - serverCount   // 새로 증설한 서버: 필요한 서버 - 현재 서버 개수
            serverCount += (needs - serverCount)    // 서버 증설
        }
    }
    
    return server.reduce(0, +)
}
