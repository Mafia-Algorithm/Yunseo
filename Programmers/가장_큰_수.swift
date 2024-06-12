import Foundation

func solution(_ numbers:[Int]) -> String {
    var numbers = numbers
    var strNum = numbers.map{String($0)}.sorted{$0 + $1 > $1 + $0}        // 문자로 변환하여 정렬

    if strNum[0] == "0" {
        return "0"
    }
    
    return strNum.joined()
}
