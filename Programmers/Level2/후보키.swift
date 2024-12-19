// 후보키: 유일하게 식별, 꼭 필요한 속성으로만 구성
// 후보키 최대 개수 구하기

// 1 <= column <= 8
// 1 <= row <= 20

// 1. combination 만들기
// 2. 조합별로 keySet만들기
// 3. set의 개수가 relation의 개수와 같다면 Unique만족
// 4. 그동안의 후보키 중 현재 후보의 원소를 하나라도 가지고 있다면 Minimum 불만족

import Foundation

func solution(_ relation:[[String]]) -> Int {
    let column = (0..<relation[0].count).map{$0}
    var answer = [[Int]]()
    
    // 조합 만들기
    var allCombi = [[Int]]()
    var temp = [Int]()
    func combination(_ index: Int, _ temp: inout [Int], _ size: Int) {
        if temp.count == size {
            allCombi.append(temp)
            return
        }
        
        for i in index..<column.count {
            temp.append(i)
            combination(i+1, &temp, size)
            temp.removeLast()
        }
    }
    
    // 유일성 만족 여부
    func isUnique(_ column: [Int]) -> Bool {
        var keySet = Set<String>()
        
        for r in relation {
            var key = ""
            for c in column {           // col 순회
                key.append(r[c])        // row의 col 하나씩 붙여서 문자열로 만듦
            }
            
            if keySet.contains(key) { return false }
            keySet.insert(key)
        }
        return true
    }
    
    // 최소성 만족 여부 Set공부 해야겠ㄷ항 응응 뭔데 ?
    func isMinimum(_ keyColumn: [Int]) -> Bool {
        for candidateKey in answer {
            if Set(candidateKey).isSubset(of: Set(keyColumn)) {
                return false  // 부분 집합이면 최소성 불만족
            }
        }
        return true
    }
    
    // 후보키가 될 수 있는 모든 속성의 경우의 수 구하기
    for c in 1...column.count {
        temp = []
        combination(0, &temp, c)
    }
    
    for keyColumn in allCombi {
        if isUnique(keyColumn) && isMinimum(keyColumn) {
            answer.append(keyColumn)
        }
    }
    
    return answer.count
}
