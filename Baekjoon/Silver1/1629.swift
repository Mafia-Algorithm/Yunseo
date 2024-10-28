// 1629 - 곱셈(0.5초, 128MB)
// A를 B번 곱한 수, 대신 C로 나눈 나머지 출력
// A, B, C는 모두 2,147,483,647 이하의 자연수
// 20억을 20억번 곱할 수 있어야 함.

// 2^64 = 2^60 ~= (2^10)^6 = 10^18
// 10^18 = 1,000,000,000,000,000,000
// 2,000,000,000 * 2,000,000,000 = 4 * 10*81,,?

// 시간초과 (0.5초,, 5000만번 ?, O(N)으로 풀면 안됨.. )
import Foundation

let nums = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = nums[0]
let B = nums[1]
let C = nums[2]

var answer = 1

// Point: 같은 수를 곱하더라도 변수에 저장하고 반복하는게 훨씬 시간복잡도를 줄일 수 있음. funcA * funcA는 함수를 중복해서 실행함.
func multi(a: Int, b: Int) -> Int {
    if b == 0 { return 1 }
    if b % 2 == 0 {             // 짝수번 곱할 때
        let result = multi(a: a, b: b/2) % C
        return (result * result) % C
    } else {                    // 홀수번 곱할 때
        let result = multi(a: a, b: (b-1)/2) % C
        return (result * result % C) * A % C
    }
}

print(multi(a: A, b: B))

// 예시
//2, 11, 5
//
//(2^11) % 5 = (2^10 * 2) % 5 = (2^10 % 5) * (2 % 5)
//
//(2^10) = (2^5 % 5) * (2^5 % 5)
