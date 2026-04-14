import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    /// 후보가 될 수 있는지 여부
    func checkBan(_ target: String, _ banned_id: String) -> Bool {
        if target.count != banned_id.count { return false }
        
        for (c1, c2) in zip(target, banned_id) {
            if c2 != "*" && c1 != c2 { return false }
        }
        return true
    }
    
    // 제재 아이디 구하기
    var candidate: [[String]] = []
    for ban in banned_id {
        var temp: [String] = []
        for user in user_id {
            if checkBan(user, ban) {
                temp.append(user)
            }
        }
        candidate.append(temp)
    }
    
    // 후보 케이스 구하기
    var answer: Set<Set<String>> = []
    var used: Set<String> = []
    func dfs(_ depth: Int, _ list: Set<String>) {
        if list.count == banned_id.count {    /// banned_id 만큼 인원이 모인 경우 후보에 insert
            answer.insert(list)
            return
        }
        
        for user in candidate[depth] {
            if !used.contains(user) {                // 아직 포함되지 않은 사용자의 경우
                used.insert(user)
                dfs(depth + 1, list.union([user]))  // union은 시퀀스만 취급하기 때문에 [] 필요
                used.remove(user)
            }
        }
    }
    
    dfs(0, [])
    
    return answer.count
}
