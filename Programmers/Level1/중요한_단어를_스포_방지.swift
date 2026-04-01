import Foundation

func solution(_ message:String, _ spoiler_ranges:[[Int]]) -> Int {
    // 1. 문자, 시작인덱스, 끝인덱스 나눔
    let chars = Array(message)
    var messageInfo: [(word: String, start: Int, end: Int)] = []
    var startIndex = 0
    while startIndex < chars.count {
        // 공백이면 시작 인덱스 초기화
        if chars[startIndex] == " " {
            startIndex += 1
            continue
        }
        // 단어 구간 찾기
        var endIndex = startIndex
        while endIndex < chars.count && chars[endIndex] != " " {
            endIndex += 1
        }
        messageInfo.append((word: String(chars[startIndex..<endIndex]), start: startIndex, end: endIndex - 1))
        
        // 새로운 인덱스로 시작
        startIndex = endIndex
    }
    
    
    // 2. 스포 구간, 아닌구간 배열로 저장
    var isSpoil = Array(repeating: false, count: chars.count)
    spoiler_ranges.forEach {
        for i in $0[0]...$0[1] {
            isSpoil[i] = true
        }
    }
    
    // 3. 다시 1번을 순회하면서 스포방지 단어인지 아닌지 체크하는 배열 생성
    var spoiledWord = Set<String>()
    var unSpoiledWord = Set<String>()
    
    for (word, s, e) in messageInfo {
        if !(s...e).contains(where: { isSpoil[$0] }) {
            unSpoiledWord.insert(word)
        }
    }

    for (word, s, e) in messageInfo {           // 모든 단어 확인
        // 스포 방지 구간에 있고, 노출된 단어가 아니고, 스포 방지 단어가 아니라면
        if (s...e).contains(where: { isSpoil[$0] }) && !unSpoiledWord.contains(word) {
            spoiledWord.insert(word)
        } else {
            unSpoiledWord.insert(word)
        }
    }
    
    return spoiledWord.count
}
