import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var nameScore = [String: Int]()
    var result: [Int] = []
    
    // 사전 초기화
    for i in 0..<name.count {
        nameScore[name[i]] = yearning[i]
    }
    
    var temp = 0
    for peoples in photo {
        for p in peoples {
            if let score = nameScore[p] {    // 딕셔너리에 키가 존재하는 경우만 더함
                temp += score
            }
        }
        result.append(temp)
        temp = 0
    }
    
    return result
}
