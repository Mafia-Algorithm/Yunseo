import Foundation

func solution( _ dirs:String) -> Int {
    var visit = [[[Int]]]()
    var now = [0, 0]
    var next = [Int]()
    var result = 0
    
    for i in dirs {
        switch i {
        case "U":
            next = [now[0], now[1] + 1]
        case "D":
            next = [now[0], now[1] - 1]
        case "L":
            next = [now[0] - 1, now[1]]
        default:
            next = [now[0] + 1, now[1]]
        }
        
        if (-5...5).contains(next[0]) && (-5...5).contains(next[1]) {
            if visit.contains([next, now]) || visit.contains([now, next]) { } else {
                visit.append([next, now])
                visit.append([now, next])
                result += 1
            }
            now = next
        }
    }
    return result
}
