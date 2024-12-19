// 토핑 가짓수가 동일해야함
// 1 <= 토핑 길이 <= 100000
// 1 <= 토핑 종류 만개 <= 10000

// 투포인터, 해시맵, 슬라이딩 윈도우 O(n)

import Foundation

func solution(_ topping:[Int]) -> Int {
    var leftDict = [Int: Int]()             // 토핑: 가짓수
    var leftTopping = Set<Int>()            // left의 토핑 개수
    
    var rightDict = [Int: Int]()             // 토핑: 가짓수
    var rightTopping = Set<Int>()            // right의 토핑 개수
    
    // left는 재료0개, right가 모두 가지고 있음
    topping.map {
        leftDict[$0] = 0
        rightDict[$0, default: 0] += 1
        rightTopping.insert($0)
    }
    
    var answer = 0
    
    // 0 1 2 3 4이면 3까지이므로 topping.count - 1
    for i in 0..<topping.count-1 {
        let ingredient = topping[i]
        
        // 왼쪽에 토핑 +1
        leftDict[ingredient]! += 1
        leftTopping.insert(ingredient)
        
        // 오른쪽 토핑 -1
        rightDict[ingredient]! -= 1
        if rightDict[ingredient] == 0 {
            rightTopping.remove(ingredient)
        }
        
        // 양쪽 set의 개수가 같다면 정답 + 1
        if leftTopping.count == rightTopping.count {
            answer += 1
        }
    }
    
    return answer
}
