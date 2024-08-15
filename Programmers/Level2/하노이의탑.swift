import Foundation

func solution(_ n:Int) -> [[Int]] {
    var answer: [[Int]] = []                                            // 정답을 저장할 배열
    func hanoi(_ start: Int, _ temp: Int, _ end: Int, _ n: Int) {       // 시작, 남는 기둥, 도착 기둥, 옮기는 원판 수
        if n == 1 {                                                     // 원판 수 한 개일 때 이동 기록
            answer.append([start, end])
            return 
        }
        hanoi(start, end, temp, n-1)
        hanoi(start, temp, end, 1)
        hanoi(temp, start, end, n-1)
    }
    
    hanoi(1, 2, 3, n)
    
    return answer
}
