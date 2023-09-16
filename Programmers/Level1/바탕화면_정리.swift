import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var info = [[String]]()
    var xList = Set<Int>()
    var yList = Set<Int>()
    
    // 배열로 저장
    for w in wallpaper {
        info.append(w.map{String($0)})
    }
    
    for i in 0..<info.count {
        if info[i].contains("#") {
            yList.insert(i)
            yList.insert(i+1)
        } else { 
            continue
        }
        for j in 0..<info[i].count {
            if info[i][j] == "#" {
                xList.insert(j)
                xList.insert(j+1)
            }
        }
    }
    
    
    return [yList.min()!, xList.min()!, yList.max()!, xList.max()!]
}
