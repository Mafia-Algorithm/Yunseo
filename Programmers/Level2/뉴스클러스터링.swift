// J(A, B) = A.intersection(B).count / (A.count + B.count) - A.intersection(B).count
// A == 0, B == 0인 경우 1

func solution(_ str1:String, _ str2:String) -> Int {
    // 소문자 통일
    let str1 = str1.lowercased().map{String($0)}
    let str2 = str2.lowercased().map{String($0)}
    
    // 입력으로 들어온 문자열은 두 글자씩 끊어서 다중집합의 원소로 만든다.
    func arrayToMultiSet(_ target: [String]) -> [String] {
        var result = [String]()
        
        // 영문자로 된 글자 쌍만 유효, 기타 공백이나 숫자, 특수 문자가 들어있는 경우는 그 글자 쌍을 버린다.
        (0..<target.count-1).forEach{
            // isLetter는 Character에서만 사용 가능
            if Character(target[$0]).isLetter && Character(target[$0+1]).isLetter {
                result.append(target[$0...$0+1].joined())
            }
        }
        
        return result
    }
    
    var multiSet1 = arrayToMultiSet(str1)
    var multiSet2 = arrayToMultiSet(str2)
    
    let allElementCount = multiSet1.count + multiSet2.count
    
    var intersect = 0

    // 교집합 원소 개수 구하기
    for i in 0..<multiSet1.count {
        if let delete = multiSet2.firstIndex(of: multiSet1[i]) {
            multiSet2.remove(at: delete)
            intersect += 1
        }
    }
    
    // 합집합 원소 개수 구하기
    let interCount: Double = Double(intersect)
    let allCount: Double = Double(allElementCount) - interCount
    
    // ⭐️ 합집합 원소 개수가 0이면 나눌 수 없으므로 예외처리
    if allCount == 0 {
        return 1 * 65536
    } else {
        return Int((interCount / allCount) * 65536)
    }
}
