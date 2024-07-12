import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var r = d * d
    var answer: Int64 = 0
    
    /// 원의 방정식 이용 y^2 <= d^2 - x^2
    for x in stride(from: 0, to: d+1, by: k) {
        answer += Int64(Int(sqrt(Double(r - (x * x)))) / k)
    }
    answer += Int64((d / k) + 1)
    
    return answer
}
