/// 최소공배수 -> 두 수의 곱 / 최대공약수
/// 최대공약수 -> 모듈러 연산

// 45, 18
// 45 % 18 = 9
// 18 % 9 = 2
// 9 % 2 = 1

// 6 % 2 = 0

// 2 % 3 = 2
// 3 % 2 = 1
// 2 % 1 = 0

// 4 % 2 = 0

// 나머지가 0일 때 b반환

func solution(_ arr:[Int]) -> Int {
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a % b == 0 { return b }
        
        return gcd(b, a%b)
    }
    
    // 초기값 = 1
    return arr.reduce(1) { $0 * $1 / gcd($0, $1) }
}
