import Foundation

// 각 로봇은 최단거리로 이동(우선순위 r->c)
// 이동 시간 별 로봇의 충돌 횟수 구하기
// ex) 로봇이 (1,1)에 3대 있어도 충돌은 1회로 간주

func solution(_ points:[[Int]], _ routes:[[Int]]) -> Int {
    
    // A -> B로 가는 최단 경로 찾기(경로 배열로 저장)
    func findRoute(_ start: [Int], _ end: [Int], _ route: [[Int]]) -> [[Int]] {
        var route: [[Int]] = route     // 기존 경로에 이어서 저장
        var nr = start[0]
        var nc = start[1]
        
        // 상하 비교(r이 우선이기 때문)
        while nr != end[0] {
            nr = nr > end[0] ? nr - 1 : nr + 1
            route.append([nr, nc])
        }
        
        // 좌우 비교
        while nc != end[1] {
            nc = nc > end[1] ? nc - 1 : nc + 1
            route.append([nr, nc])
        }
        
        return route
    }
    
    // 1초마다 충돌이 있는지 확인
    func findCrash() -> Int {
        var crashCount = 0
        let maxTime = allRoutes.map{ $0.count }.max()!   // 가장 길게 이동하는 로봇 기준
        
        for i in 0..<maxTime {                           // 로봇의 최대 이동 시간  
            var crashInfo = [String: Int]()              // 위치별 로봇 개수
            
            for robot in 0..<allRoutes.count {
                // 현재 시간 > =로봇이 이동하는 횟수인 경우 종료
                if i >= allRoutes[robot].count{ continue }  
                
                // 현재 위치별 로봇 개수
                let route = "\(allRoutes[robot][i][0]) \(allRoutes[robot][i][1])"
                crashInfo[route, default: 0] += 1
            }
            
            // 위치 별 로봇 개수가 1개 이상인 경우 count
            for c in crashInfo {
                if c.value > 1 {
                    crashCount += 1
                }
            }
        }
        return crashCount
    }
    
    
    var allRoutes: [[[Int]]] = []              // 모든 로봇의 경로
    for r in routes {
        var route: [[Int]] = [points[r[0] - 1]] // 시작 위치
        var i = 0
        
        // ex) 1-4-3-2 좌표를 통해 이동하는 전체 경로
        while i < r.count-1 {
            let start = points[r[i]-1]         // 1번 위치는 points의 0번째 값
            let end = points[r[i+1]-1]
            route = findRoute(start, end, route)
            
            i += 1
        }
        allRoutes.append(route)
    }
    
    return findCrash()
}
