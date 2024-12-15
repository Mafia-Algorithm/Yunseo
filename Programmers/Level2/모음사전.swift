import Foundation

func solution(_ word:String) -> Int {
    let dictRule = [781, 156, 31, 6, 1]
    let dict = ["A": 0, "E": 1, "I": 2, "O": 3, "U": 4]
    var index = 0
    var result = 0
    
    for i in word {
        result += dictRule[index] * dict[String(i)]! + 1
        index += 1
    }
    
    return result
}
