import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)

    /// arr2.map{ $0[c] } -> 2차원 배열의 열값 추출
    for r in 0..<arr1.count {
        for c in 0..<arr2[0].count {
            answer[r][c] = zip(arr1[r], arr2.map{ $0[c] }).reduce(0) {
                // reduce 자체가 누적합이기 때문에 + 사용해야함. +=는 누적합이 반복
                $0 + $1.0 * $1.1    
            }
        }
    }
    return answer
}
