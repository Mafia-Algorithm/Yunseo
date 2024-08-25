import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    return checkBrown(getLength(yellow), yellow, brown)
}

func getLength(_ yellow: Int) -> [Int] {
    var length: [Int] = []
    for i in 1...Int(sqrt(Double(yellow))) {
        if yellow % i == 0 {
            length.append(i)
        }
    }
    return length
}

func checkBrown(_ length: [Int], _ yellow: Int, _ brown: Int) -> [Int] {
    var width = 0
    for i in length {
        width = yellow / i
        if width * 2 + i * 2 + 4 == brown {
            return [width + 2, i + 2]
        }
    }
    return []
}

