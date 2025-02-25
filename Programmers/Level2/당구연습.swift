import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    var answer = [Int]()
    for b in balls {
        var temp = [Int]()
        let north = [b[0], b[1] + (n - b[1])*2]
        let south = [b[0], -b[1]]
        let east = [b[0] + (m-b[0])*2, b[1]]
        let west = [-b[0], b[1]]
        
        var info = [north, south, east, west]
        
        if startX == b[0] && startY > b[1] {
            info.remove(at: 1)
        } else if startX == b[0] && startY < b[1] {
            info.remove(at: 0)
        } else if startX > b[0] && startY == b[1] {
            info.remove(at: 3)
        } else if startX < b[0] && startY == b[1] {
            info.remove(at: 2)
        }
        
        for i in info {
            let cal = ((startX - i[0]) * (startX - i[0])) + ((startY - i[1]) * (startY - i[1]))
            temp.append(cal)
        }
        
        temp.sort(by: {$0 < $1})
        answer.append(temp[0])
    }
    return answer
}
