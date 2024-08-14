import Foundation

func solution(_ record:[String]) -> [String] {
    
    var temp: [[String]] = []                                  // 출력 시 사용할 정보
    var nickName: [String: String] = [:]                       // 아이디: 닉네임 정보
    var answer: [String] = []                                  // 정답 출력
    
    for i in 0..<record.count {
        let r = record[i]
        let command = r.split(separator: " ").map{String($0)}
        let usr = command[1]                                   // 유저 아이디
        
        // 닉네임 업데이트
        if command[0] == "Enter" || command[0] == "Change" {
            nickName[usr, default: ""] = command[2]            
        }
        
        temp.append([command[0], usr])
    }
    
    // 정보별 메세지 출력
    for t in temp {
        if t[0] == "Enter" {
            answer.append("\(nickName[t[1]]!)님이 들어왔습니다.")
        } else if t[0] == "Leave" {
            answer.append("\(nickName[t[1]]!)님이 나갔습니다.")
        }
    }
    
    return answer
}
