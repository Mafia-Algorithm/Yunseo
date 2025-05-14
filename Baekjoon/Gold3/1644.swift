// 1644 - 소수의 연속합

import Foundation

let N = Int(readLine()!)!
var prime = Array(repeating: true, count: N+1)
prime[0] = false
prime[1] = false

// N=1일 때 arr.isEmpty이므로 예외처리
if N == 1 {
    print(0)
    exit(0)
}

// N까지의 소수 구하기
if N > 3 {
    for i in 2...Int(sqrt(Double(N))) {
        var j = 2
        while i * j < prime.count {
            prime[i*j] = false
            j += 1
        }
    }
}

// 슬라이딩 윈도우(연속된 구간합)
var arr = prime.enumerated().filter{$0.element}.map{$0.offset}
var left = -1, right = 0    /// [left+1, right]이기 때문에 left = -1로 초기화
var sum = arr[0]
var count = 0

while true {
    if sum == N {           /// 합이 N과 같다면 count + 1, [left + 1,right] 의 범위를 합함
        count += 1
    }
    if sum >= N {           /// 합이 N보다 크거나 같다면 크기를 줄여야하므로 lefft +=1 한 후 left+1한 숫자를 제거
        left += 1
        sum -= arr[left]
    } else {                /// 합이 N보다 작은 경우 더 큰 수를 더하기 위해 right += 1 한 후 right+1한 숫자를 더함
        right += 1
        if right == arr.count { /// 만약 right가 arr의 범위를 벗어나면 종료
            break
        } else {
            sum += arr[right]
        }
    }
}
print(count)

