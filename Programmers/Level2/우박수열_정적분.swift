// 콜라츠 추측: 모든 자연수 k에 다음 작업을 반복하면 항상 1로 만들 수 있다.
// 입력된 수가 짝수라면 2로 나눔
// 홀수라면 3을 곱하고 1을 더합
// 결과가 1보다 크면 다시 반복

// [a, -b] -> x= (a, n-b), y=0으로 둘러쌓인 공간의 면적 구하기, n은 k가 초항인 우박수열이 1이 될때까지의 횟수
// 사다리꼴 넓이 = (윗변 + 아랫변) * 높이 / 2

import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    // 우박수열 구하기
    var count = 0
    var k = k
    var points: [[Int]] = [[0, k]]        // (x, y)
    
    while k > 1 {
        if k % 2 == 0 {
            k /= 2
        } else {
            k = k * 3 + 1
        }
        count += 1
        points.append([count, k])
    }
    
    // 정적분 구하기
    var answer: [Double] = []
    ranges.forEach {
        let a = $0[0], b = count + $0[1]
        var area: Double = 0
        
        if a > b { answer.append(-1.0) }            // 범위가 유효하지 않은 경우 -1
        else {
            for i in a..<b {
                area += Double((points[i][1] + points[i+1][1])) / 2.0
            }
            answer.append(area)
        }
    }
    
    return answer
}
