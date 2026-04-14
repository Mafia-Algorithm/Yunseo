// 9시부터 n회, t분 간격으로 도착
// 최대 m명의 승객이 탈 수 있음
// 9시 도착 셔틀은 9시에 줄 선 사람까지 태움

// 콘이 사무실로 갈 수 있는 도착 시간 중 제일 늦은 시각
// 콘은 가장 뒤에 줄 섬

// 배치된 시간표에서 콘이 버스를 타기 위해 줄 서야 하는 가장 늦은 시각을 구하기

// 1. n, t에 따른 버스 시간표 구하기
// 2. timetable에 맞게 콘이 없는 경우 버스 시간 구하기
// 3. 콘이 버스를 탈 수 있는 시간 구하기
// 시간은 분으로 표현 -> 정답은 다시 HH:mm으로 변환

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    // 시각 -> 분으로 변환
    func toMin(_ time: String) -> Int {
        let clock = time.split(separator: ":").map{Int($0)!}
        return clock[0] * 60 + clock[1]
    }

    // 분 -> 시각
    func toTime(_ time: Int) -> String {
        return String(format: "%02d:%02d", time / 60, time % 60)
    }

    var time = 540
    let endTime = 1439      // 23: 59

    var busTable: [Int] = [time]                                // 버스 시간표
    var crew = timetable.map{ toMin($0) }.sorted{ $0 < $1 }      // 줄 선 시각

    // 버스 시간표 생성
    for i in 0..<n-1 {
        time += t
        busTable.append(time)
    }

    var cornIndex = 0
    var cornTime = 540
    var crewCount: [Int] = []
    
    for bus in busTable {
        var count = 0                                // 이번에 탄 승객의 수

        while count < m && cornIndex < crew.count {
            if crew[cornIndex] <= bus {        // 버스 출발 시각 전까지 줄을 섰다면
                count += 1
            } else { break }
            cornIndex += 1
        }
        crewCount.append(count)
    }

    /// 마지막 버스 확인
    if crewCount.last! != 0 {       // 마지막 버스에 탄 승객 수가 0명이 아니면
        if crewCount.last! < m {    // 마지막 버스 자리가 남은 경우
            return toTime(busTable.last!)
        } else {                    // 자리가 꽉 찬 경우
            return toTime(crew[cornIndex - 1] - 1)
        }
    } else {                        // 마지막 버스에 탄 승객 수가 0명인 경우
        return toTime(busTable.last!)
    }

    return toTime(cornTime)
}

