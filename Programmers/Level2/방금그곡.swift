import Foundation

// 시작 시각, 끝난 시각, 제목, 악보 정보

/// C#, D#, F#, G#, A#
func solution(_ m:String, _ musicinfos:[String]) -> String {
    var answer: [(String, Int)] = []
    
    var m = m
    m = m.replacingOccurrences(of: "C#", with: "H")
    m = m.replacingOccurrences(of: "D#", with: "I")
    m = m.replacingOccurrences(of: "F#", with: "J")
    m = m.replacingOccurrences(of: "G#", with: "K")
    m = m.replacingOccurrences(of: "A#", with: "L")
    m = m.replacingOccurrences(of: "B#", with: "M")
    
    for (i, music) in musicinfos.enumerated() {
        let info = music.split(separator: ",").map{String($0)}
        
        /// 플레이 시간
        let start = info[0].split(separator: ":").map{Int(String($0))!}
        let end = info[1].split(separator: ":").map{Int(String($0))!}
        let playTime = end[0] * 60 + end[1] - start[0] * 60 - start[1]
        
        /// 멜로디
        var melody = info[3]
        melody = melody.replacingOccurrences(of: "C#", with: "H")
        melody = melody.replacingOccurrences(of: "D#", with: "I")
        melody = melody.replacingOccurrences(of: "F#", with: "J")
        melody = melody.replacingOccurrences(of: "G#", with: "K")
        melody = melody.replacingOccurrences(of: "A#", with: "L")
        melody = melody.replacingOccurrences(of: "B#", with: "M")
        
        /// 플레이 구간
        var playMelody = ""
        let mStart = melody.startIndex
        let mEnd = melody.index(mStart, offsetBy: playTime % melody.count)
        playMelody.append(String(repeating: melody, count: playTime / melody.count))
        playMelody.append(String(melody[mStart..<mEnd]))

        if playMelody.contains(m) {
            answer.append((info[2], playTime))
        }
    }
    
    if answer.isEmpty {
        return "(None)"
    }
    
    answer.sort {$0.1 > $1.1}
    
    return answer.first!.0
}
