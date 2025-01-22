// 양방향 통신

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var mapInfo = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
    var answer = 0
    
    // 자기 자신으로 가는 비용 = 0
    (1...N).forEach {
        mapInfo[$0][$0] = 0
    }
    
    // 주어진 간선 정보 업데이트
    for r in road {
        mapInfo[r[0]][r[1]] = min(r[2], mapInfo[r[0]][r[1]])
        mapInfo[r[1]][r[0]] = min(r[2], mapInfo[r[1]][r[0]])
    }
    
    for middle in 1...N {
        for start in 1...N {
            for end in 1...N {
                if mapInfo[start][middle] == Int.max || mapInfo[middle][end] == Int.max { continue }
                mapInfo[start][end] = min(mapInfo[start][middle] + mapInfo[middle][end], mapInfo[start][end])
            }
        }
    }
    
    for end in 1...N {
        if mapInfo[1][end] <= k { 
            answer += 1
        }
    }
    
    return answer
}
