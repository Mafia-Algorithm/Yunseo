// 압축하고자 하는 영역 S
// s가 모두 같은 값인 경우 하나로 압축
// 그렇지 않은 경우 4개로 쪼갠 뒤, 다시 압축
// 최종적으로 남는 0과 1의 개수 return

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var zero = 0
    var one = 0
    
    // 시작 지점을 인덱스로 받음
    func squardCompress(_ y: Int, _ x: Int, _ width: Int) {
        // (y,x) ~ (y+width, x+width)영역이 모두 같은 경우 압축
        let check = isAllZero(y, x, width)
        if check == 0 {
            zero += 1
        } else if check == 1 {
            one += 1
        } else {
            let halfWidth = width / 2
            squardCompress(y, x, halfWidth)
            squardCompress(y+halfWidth, x, halfWidth)
            squardCompress(y, x+halfWidth, halfWidth)
            squardCompress(y+halfWidth, x+halfWidth, halfWidth)
        }
    }
    
    // 영역이 모두 같은 숫자인지 확인
    func isAllZero(_ y: Int, _ x: Int, _ width: Int) -> Int {
        let target = arr[y][x]
        for r in y..<y+width {
            for c in x..<x+width {
                if arr[r][c] != target {
                    return -1
                }
            }
        }
        return target
    }
    
    squardCompress(0, 0, arr.count)
    
    return [zero, one]
}
