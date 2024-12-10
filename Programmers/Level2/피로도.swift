import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var visitDungeons = Array(repeating: false, count: dungeons.count)
    var k = k
    var result: Int = 0
    var temp: Int = 0
    
    func dfs(_ i: Int) {
        result = max(result, temp)
        
        for i in 0..<dungeons.count {
            // 던전을 아직 방문하지 않았고, 던전의 최소 필요 피로도가 현재 피로도보다 작으면 방문 가능
            if !visitDungeons[i] && dungeons[i][0] <= k {
                visitDungeons[i] = true
                temp += 1
                k -= dungeons[i][1]
                
                // 다음 던전 확인
                dfs(i+1)
                
                visitDungeons[i] = false
                temp -= 1
                k += dungeons[i][1]
            }
        }
    }
    dfs(0)
    
    return result
}
