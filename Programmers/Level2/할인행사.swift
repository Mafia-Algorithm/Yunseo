import Foundation

/// want: number(물건: 원하는 개수)
/// 10일간 원하는 물건이 개수만큼 모두 할인하는 날에 회원가입

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var dict = [String: Int]()                  // 현재일로부터 10일간 물건 현황
    var wantedDict = [String: Int]()            // 구매하려는 물건 현황
    var check = [String: Bool]()                // 구매하려는 물건 중 확인된 품목
    
    /// 1일부터 최초 10일의 할인 목록
    (0..<10).forEach {
        dict[discount[$0], default: 0] += 1
    }
    
    /// 내가 원하는 목록
    zip(want, number).forEach {
        wantedDict[$0.0] = $0.1
        check[$0.0] = false
    }
    
    var left = 0
    var right = left + 10
    var answer = 0
    
    while right <= discount.count {
        for (key, value) in dict {
            /// 세일 품목에 없을 때 -> continue
            guard let wanted = wantedDict[key] else { continue }
            
            /// 세일 개수가 부족할 때 -> false
            if wanted > value { 
                check[key] = false
                break
            } else {
                check[key] = true
            }
        }
        
        /// 모든 품목이 확인 된 경우
        if check.allSatisfy({$0.value == true}) { answer += 1 }
        
        /// 다음 날 상태로 변경
        if right < discount.count {
            dict[discount[left], default: 0] -= 1
            dict[discount[right], default: 0] += 1
        }
        
        left += 1
        right += 1
    }
    
    return answer
}


/// 방법2) 사전을 만들지 않고 want의 물건 순서가 number와 같음을 사용
func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var answer = 0
    
    for i in 0..<(discount.count-9) {       // 세일 시작일
        var temp = Array(repeating: 0, count: want.count)
        for j in i..<(i+10) {             // 세일 구간
            // 원하는 품목의 첫번째 인덱스가 있다면 temp[index] 값 += 1
            // want의 개수 순서가 number와 같기 때문에
            if let index = want.firstIndex(of: discount[j]) {
                temp[index] += 1
            }
        }
        
        /// temp와 number의 값이 동일한 경우
        if temp == number {
            answer += 1
        }
    }
    
    return answer
}
