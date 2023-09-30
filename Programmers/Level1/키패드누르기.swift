import Foundation

// 1, 4, 7인 경우는 왼손
// 3, 6, 9인 경우는 오른손
// 2, 5, 8, 0은 현재 키패드에서 더 가까운 엄지손가락

//1 2 3
//4 5 6
//7 8 9
// 10 11 12


func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var L = 10
    var R = 11
    var dict = [1: [0, 0], 2: [0, 1], 3: [0, 2],
                4: [1, 0], 5: [1, 1], 6: [1, 2],
                7: [2, 0], 8: [2, 1], 9: [2, 2],
                10: [3, 0], 0: [3, 1], 11: [3, 2]
               ]
    
    
    for n in numbers {
        if n == 1 || n == 4 || n == 7 {
            result.append("L")
            L = n
        } else if n == 3 || n == 6 || n == 9 {
            result.append("R")
            R = n
        } else {
            // 1, 1
            let rDistance = abs(dict[n]![0] - dict[R]![0]) + abs(dict[n]![1] - dict[R]![1])
            let lDistance = abs(dict[n]![0] - dict[L]![0]) + abs(dict[n]![1] - dict[L]![1])
            if rDistance > lDistance {
                result.append("L")
                L = n
            } else if rDistance < lDistance {
                result.append("R")
                R = n
            } else {
                if hand == "right" {
                    result.append("R")
                    R = n
                } else {
                    result.append("L")
                    L = n
                }
            }
        }
    }
    return result
}
