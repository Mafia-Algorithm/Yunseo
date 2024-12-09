import Foundation

// (1,2) -> 1, (3,4) -> 2 ... (n-1, n) -> n/2
// A번과 B번이 만나는 라운드 구하기

// ex) 3라운드에서 만남
// 4 -> 2 -> 1
// 7 -> 4 -> 2

// 0 -> 1 -> 2 -> 3(while 중지)
// 4 -> 2 -> 1 -> 1
// 7 -> 4 -> 2 -> 1


func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var a = a
    var b = b
    var round = 0
    while a != b {
        a = a % 2 == 0 ? a / 2 : (a+1) / 2
        b = b % 2 == 0 ? b / 2 : (b+1) / 2
        round += 1
    }
    
    return round
}
