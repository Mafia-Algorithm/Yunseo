import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var maxWidth = 0
    var maxHeight = 0
    
    for size in sizes {
        if size[0] < size[1] {              // 무조건 더 큰 쪽을 너비로 지정, 작은 쪽을 높이로 지정
            maxWidth = maxWidth > size[1] ? maxWidth : size[1]
            maxHeight = maxHeight > size[0] ? maxHeight : size[0]
        } else {
            maxWidth = maxWidth > size[0] ? maxWidth : size[0]
            maxHeight = maxHeight > size[1] ? maxHeight : size[1]
        }
    }
    
    return maxWidth * maxHeight
}
