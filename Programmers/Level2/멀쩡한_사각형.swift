import Foundation

// w*h: 전체 넓이
// w/gcd*h/gcd = w*h/gcd: 잘리는 사각형의 영역 크기
// (w/gcd-1)*(h/gcd-1): 잘리는 사각형 중 온전한 정사각형 개수
func solution(_ w:Int, _ h:Int) -> Int64{
    let gcd = getGCD(w, h)
    return Int64(w*h - (w*h/gcd) + (w/gcd-1)*(h/gcd-1)*gcd)
}


// 유클리드 호제법 a % b == 0일 때 b가 (a, b)의 최대공약수
// 시간복잡도 O(log(min(a, b)))
func getGCD(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    }
    return getGCD(b, a % b)
}
