// 0 <= cacheSize <= 30
// cities <= 100000(10만), 대소문자 구분X
// LRU 사용 -> 최근에 가장 사용되지 않은 것 교체

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let cities = cities.map { $0.lowercased() }     // 소문자 통일
    var cache = [String]()
    var time = 0
    
    // cacheSize == 0인 경우 항상 miss
    if cacheSize == 0 { return cities.count * 5 }
    
    /// cache에 데이터 넣기
    func cityCache(_ city: String) {
        // cache hit
        if cache.contains(city) {
            time += 1
            
            // 현재 도시를 캐시의 가장 최근으로 갱신
            let index = cache.firstIndex(of: city)!
            cache.remove(at: index)
            cache.append(city)
            return
        }
        
        // cache miss
        if cache.count >= cacheSize {
            cache.removeFirst()         // 가장 오래된 것 제거
        }
        cache.append(city)
        time += 5
        return
    }
    
    cities.forEach {
        cityCache($0)
    }
    
    return time
}
