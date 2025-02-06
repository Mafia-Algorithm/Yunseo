import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    var array = array
    for c in commands {
        answer.append(array[c[0]-1...c[1]-1].sorted{$0 < $1}[c[2]-1])
    }
    return answer
}
