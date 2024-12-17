
import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    
    // 앞뒤 중괄호 제거
    s.removeFirst()
    s.removeLast()
    
    // { 기준으로 분리, 배열 개수 오름차순 정렬
    let arrayS = s.split(separator: "{").map{String($0)}.sorted{$0.count < $1.count}
    
    var answer = [Int]()
    
    for s in 0..<arrayS.count {
        var str = arrayS[s]                         // 첫번째 집합
        str.remove(at: str.firstIndex(of: "}")!)    // 중괄호 제거 후 숫자 배열로 변환
        let set = str.split(separator: ",").map{Int(String($0))!}
        
        // 숫자 배열에서 정답 배열에 없는 원소만 넣어줌
        for int in set {
            if !answer.contains(int) {
                answer.append(int)
            }
        }
    }
    
    return answer
}

// 방법2) Set사용, 
// Array.contains(i)는 O(n)이지만 해시값을 사용하는 Set의 remove, insert, contains는 O(1)이다.
// func solution(_ s:String) -> [Int] {
//     var s = s
    
//     // 앞뒤 중괄호 제거
//     s.removeFirst()
//     s.removeLast()
    
//     // { 기준으로 분리, 배열 개수 오름차순 정렬
//     let arrayS = s.split(separator: "{").map{String($0)}.sorted{$0.count < $1.count}
    
//     var answer = [Int]()
//     var used = Set<Int>()
    
//     for s in 0..<arrayS.count {
//         var str = arrayS[s]                         // 첫번째 집합
//         str.remove(at: str.firstIndex(of: "}")!)    // 중괄호 제거 후 숫자 배열로 변환
//         let set = str.split(separator: ",").map{Int(String($0))!}
        
//         // 숫자 배열에서 정답 배열에 없는 원소만 넣어줌
//         for int in set where !used.contains(int) {
//             answer.append(int)
//             used.insert(int)
//         }
//     }
    
//     return answer
// }
