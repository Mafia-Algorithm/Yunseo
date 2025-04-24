// 8 <= brown <= 5000
// 1 <= yellow <= 200만

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    for height in 1...Int(sqrt(Double(yellow))) {
        if yellow % height != 0 { continue }         // 나누어 떨어지지 않는 경우 카펫을 만들 수 없음!!!
        let width = yellow / height                  // 가로 길이 >= 세로 길이 이므로 세로를 기준으로 정함
        
        if (width * 2) + (height * 2) + 4 == brown {
            return [width + 2, height + 2]
        }
    }
    
    return []
}
