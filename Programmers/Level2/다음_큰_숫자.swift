import Foundation

/// n의 다음 큰 숫자: n보다 큰 자연수
/// n의 다음 큰 숫자, n -> 2진수로 변환했을 때 1의 개수가 같음
/// 1, 2를 만족하는 수 중 가장 작은 수

//func solution(_ n:Int) -> Int {
//    let radixN = String(n, radix: 2).filter({$0 == "1"}).count
//    
//    for i in n+1...1000000 {
//        if String(i, radix: 2).filter({$0 == "1"}).count == radixN {
//            return i
//        }
//    }
//    return 0
//}

/// nonzeroBitCount 사용하는 법
func solution(_ n:Int) -> Int {
    for i in n+1...1000000 {
        if n.nonzeroBitCount == i.nonzeroBitCount {
            return i
        }
    }
    return 0
}
