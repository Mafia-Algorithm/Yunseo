import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0

    let area = w + 1                                                // 설치 기지국의 한 쪽 영향력
    var start = 1
    for i in 0..<stations.count {
        let end = stations[i] - area                                // 기지국 영향력 왼쪽 부분
        answer += (end - start + 1) / (area + w)                    // 범위 / 한 기지국의 영향 범위
        if (end - start + 1) % (area + w) > 0 { answer += 1 }       // 범위 % 한 기지국의 영향 범위
        
        start = stations[i] + area                                  // 기지국 영향력 오른쪽 부분
    }
    
    // 마지막 기지국의 전달 영역이 아파트의 끝이 아닌 경우, start == n인 부분도 한 아파트가 남은 경우로 포함되어야 함.
    if start <= n {
        answer += (n - start + 1) / (area + w)
        if (n - start + 1) % (area + w) > 0 { answer += 1 }
    }
    
    return answer
}
