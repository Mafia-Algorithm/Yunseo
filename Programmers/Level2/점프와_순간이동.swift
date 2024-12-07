import Foundation

// 방법1) n의 2진수의 1의 개수
// 5의 2진수: 101
// 101을 0으로 만드는 법
// 101 -> 100 -> 10 -> 1 -> 1
// 여기서 shift연산은 비용이 0이므로 -1인 연산일 때만 비용 1이 든다.
// 즉, 1의 개수가 비용이 됨
func solution(_ n:Int) -> Int {
    return n.nonzeroBitCount
}

// 방법2) 수학적 연산
// 짝수일 때 /2, 홀수일 때 -1
func solution(_ n:Int) -> Int {
    var target = n
    var answer = 0
    while target != 1 {
        if target % 2 == 0 {
            target /= 2
        } else {
            target -= 1
            answer += 1
        }
    }

    return answer + 1
}

// 0-1BFS로도 풀 수 있음. 하지만 최적의 방법이 아님 (https://www.acmicpc.net/problem/13549)와 비교
// 0-1BFS는 이동 경로 최적화에 적합
// 수학적 방법은 배터리 소모량이기 때문
// 이 문제는 순간이동을 최대한 많이 사용해야하는 문제, 물론 가중치 문제로 볼 수 있지만 단순하게 수학적으로도 풀 수 있다고 생각하면 됨
