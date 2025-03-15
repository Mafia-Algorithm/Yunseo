// 노래는 고유 번호로 구분
// 장르 별 재생횟수 순
// 장르 내 재생횟수 순
// 장르 내 고유번호 순

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dict: [String: [(Int, Int)]] = [:]                      // 장르: (고유번호, 재생횟수)
    var genreCount: [String: Int]  = [:]                        // 장르별 재생횟수
    
    var index = 0
    zip(genres, plays).forEach {                                // 장르별 노래 정보와 재생횟수 계산
        dict[$0, default: []].append((index, $1))
        genreCount[$0, default: 0] += $1
        index += 1
    }
    
    var genreSorted: [String] = []                              // 많이 재생된 장르순으로 정렬
    genreCount.sorted{$0.value > $1.value}.forEach {
        genreSorted.append($0.key)
    }
    
    var answer: [Int] = []
    genreSorted.forEach {                                       // 장르 내 노래 재생 횟수, 장르 내 노래 번호 오름차순
        let genreMusic = dict[$0]!.sorted { 
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            }
            return $0.1 > $1.1
        }
        
        if genreMusic.count < 2 {                               // 장르 내 노래가 2곡 미만인 경우
            genreMusic.forEach {
                answer.append($0.0)
            }
        } else {
            genreMusic[0..<2].forEach {                         // 장르 내 노래가 2곡 이상인 경우
                answer.append($0.0)
            }
        }
    }
    
    return answer
}
