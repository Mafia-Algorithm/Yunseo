import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ signals:[[Int]]) -> Int {
    // 처음 노란불이 켜지는 시간, 노란불 지속 시간, 한 사이클
    var signalInfo: [(first: Int, yellow: Int, cycle: Int)] = []
    signals.map{
        signalInfo.append(($0[0] + 1, $0[1], $0[0] + $0[1] + $0[2]))
    }
    
    let startTime = signalInfo.map{ $0.first }.max()!
    let totalCycle = signalInfo.map{ $0.cycle }.reduce(1, lcm)
    
    for i in startTime...totalCycle {
        let allSatisfy = signalInfo.allSatisfy {
            (i - $0.first) % $0.cycle < $0.yellow
        }
        
        if allSatisfy { return i }
    }
    
    return -1
}

// TestCase
// 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0
// x x 0 0 0 x x x x 0 0 0 x x x x 0 0 0 x: yellow 3, cycle: 7
// x x x 0 x x x x x x 0 x x x x x x 0 x x: yellow 4, cycle: 7
// x x 0 x x x x 0 x x x x 0 x x x x 0 x x: yellow 3, cycle: 4

// 최소 4초부터, 28초 사이

// (x - 3) % 7 == 0 ~ 2 -> <= 3

/// 규칙
/// (시간 - 노란불이 나오는 첫 시간) % 한 사이클 <= 노란불 지속 시간

/// 무조건 신호등의 노란불이 등장해야 함 -> 시작 시간은 가장 늦게 켜지는 노란불
/// 여러 신호등의 최소공배수만큼 확인, 이후에는 반복 -> 마지막 시간은 최소공배수 시간
