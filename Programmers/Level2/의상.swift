// 매일 코디가 달라야 함
// 종류 별 최대 1가지 의상
// 아무것도 안 입을 수 없음

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesDict = [String: [String]]()      // 종류: 옷 리스트
    clothes.forEach {
        clothesDict[$0[1], default: []].append($0[0])
    }
    
    var answer = 1
    return clothesDict.reduce(1) {              // 초깃값:1, 이전값 * 현재 옷 종류 + 1
        $0 * ($1.value.count + 1)
    } - 1
}
