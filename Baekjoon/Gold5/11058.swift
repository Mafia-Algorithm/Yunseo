// 11058 - 크리보드

// 1초, 256MB

//화면에 A를 출력한다.
//Ctrl-A: 화면을 전체 선택한다
//Ctrl-C: 전체 선택한 내용을 버퍼에 복사한다
//Ctrl-V: 버퍼가 비어있지 않은 경우에는 화면에 출력된 문자열의 바로 뒤에 버퍼의 내용을 붙여넣는다.
//크리보드의 버튼을 총 N번 눌러서 화면에 출력된 A개수를 최대로하는 프로그램을 작성하시오.
// 4개 행동

import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)

for i in 1...N {
    dp[i] = i
}
if N < 6 {          // 6까지는 모두 적는 것이 좋음
    print(dp[N])
    exit(0)
} else {
    for i in 6...N {
        for j in 1...i-4 {          // 붙여넣기를 어디서부터 하는지
            // 모두 입력, 버퍼 업데이트 후 복붙, 이전 버퍼 복붙(-2: 전체선택, 복사의 경우)
            dp[i] = max(dp[i], dp[i-3] * 2, dp[j]+dp[j]*(i-j-2))
        }
    }
}
print(dp[N])

