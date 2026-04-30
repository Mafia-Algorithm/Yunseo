// 연속 부분 수열에 같은 길이의 펄스 수열을 각 원소끼리 곱해 연속 펄스 부분 수열을 만들자
// 펄스 수열: 1, -1이 번갈아 나오는 수열


import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    var sequence1 = sequence.enumerated().map {
        $0.0 % 2 == 0 ? $0.1 * 1 : $0.1 * -1
    }
    
    var sequence2 = sequence.enumerated().map {
        $0.0 % 2 == 1 ? $0.1 * 1 : $0.1 * -1
    }
    
    // 카데인 알고리즘: 음수가 섞인 수열 중 연속 수열의 합 중 최댓값 구하기
    var sum1 = 0, sum2 = 0, max1 = 0, max2 = 0
    for i in 0..<sequence.count {
        sum1 = max(sequence1[i], sum1 + sequence1[i])
        sum2 = max(sequence2[i], sum2 + sequence2[i])
        
        max1 = max(max1, sum1)
        max2 = max(max2, sum2)
    }
    
    return Int64(max(max1, max2))
}
