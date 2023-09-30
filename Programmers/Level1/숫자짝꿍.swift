import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xDict = [String: Int]()
    var yDict = [String: Int]()
    var result = ""
    
		// x와 y의 숫자 개수를 딕셔너리에 저장
    X.forEach{ xDict[String($0), default: 0] += 1 }
    Y.forEach{ yDict[String($0), default: 0] += 1 }
    
    for (k, v) in xDict {
				// x의 숫자가 y에도 있는지 확인
        if yDict[k] == nil {
            xDict.removeValue(forKey: k)
        } else {
            xDict[k] = min(yDict[k]!, xDict[k]!)  // 있다면 y에서의 개수와 x에서의 개수 중 적은 숫자만큼 숫자 리스트에 추가
        }
    }
    
    if xDict.count == 0 {                         // 숫자 리스트의 개수가 0개이면 -1 리턴
        return "-1"
    } else if xDict.count == 1 && xDict.first!.key == "0" {     // 숫자의 첫번째가 0이면 0 리턴
        return "0"
    }
    
    for (k, v) in xDict {
        for _ in 0..<v {
            result.append(k)
        }
    }

		// 숫자 내림차순으로 바꿔서 하나씩 문자열에 추가
    var sortedResult = result.map{Int(String($0))!}.sorted()
    var answer = ""
    for r in sortedResult.reversed() {
        answer.append(String(r))
    }
    return answer
}
