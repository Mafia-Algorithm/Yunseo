// 1. 메뉴 조합 찾기
// 2. 메뉴 조합 별 주문 횟수 구하기
// 3. count인 메뉴 조합 별 주문 횟수의 최대 구하기
// 4. 주문 횟수가 3번과 같고 메뉴 조합 개수도 count인 메뉴 조합 구하기
// 5. 메뉴 정렬

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var menuList: [String: Int] = [:]			// 메뉴조합: 주문 횟수
    var answer = [String]()                     // 정답 메뉴 배열
    
    // target에서 count의 조합 찾기
    func combination(_ index: Int, _ tempMenu: [String], _ count: Int, _ target: [String]) {
        // 메뉴 별 주문 횟수 구하기
        if tempMenu.count == count {
            menuList[tempMenu.sorted().joined(), default: 0] += 1
        }
        
        var tempMenu = tempMenu
        
        for i in index..<target.count {
            tempMenu.append(target[i])
            combination(i+1, tempMenu, count, target)
            tempMenu.removeLast()
        }
    }
    
    // 메뉴 조합 당 주문 횟수 찾기
    for o in orders {				        // 메뉴 순회
        let target = o.map{String($0)}
        for c in course {			        // 코스 순회
            combination(0, [], c, target)
        }
    }
    
    menuList = menuList.filter{$0.value >= 2}       // 2회 이상 주문한 메뉴
 
    for c in course {
        // 주문 횟수가 최대인 메뉴
        let maxCount = menuList.filter{ $0.key.count == c }.values.max()
        
        // 주문 횟수가 최대인 메뉴, 메뉴 조합 개수가 count인 메뉴
        answer.append(contentsOf: menuList.filter{$0.value == maxCount && $0.key.count == c}.keys)
    }
    
    return answer.sorted(by: <)
}
