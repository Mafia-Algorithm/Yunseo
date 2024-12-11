func solution(_ n:Int) -> Int {
    var dp = Array(repeating: 0, count: n+1)
    
    /// for문에서 범위가 3 이상이기 때문에 code dump 발생
    if n == 1 { return 1 }
    else if n == 2 { return 2 }
    else {
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = (dp[i-1] + dp[i-2]) % 1234567
        }
    }
    
    return dp[n]
}
