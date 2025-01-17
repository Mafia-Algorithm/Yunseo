import Foundation

func calculate(_ priority: [String], _ number: [Int], _ express: [String]) -> Int {
    var number = number
    var express = express
    
    for p in priority {
        while let index = express.firstIndex(of: p) {
            express.remove(at: index)
            if p == "+" {
                number[index] = number[index] + number[index+1]
            } else if p == "-" {
                number[index] = number[index] - number[index+1]
            } else if p == "*" {
                number[index] = number[index] * number[index+1]
            }
            
            number.remove(at: index+1)
        }
    }
    
    return abs(number[0])
}

func solution(_ expression:String) -> Int64 {
    var numbers = expression.components(separatedBy: ["+", "-", "*"]).map{Int(String($0))!}
    var express = expression.filter{"+-*".contains($0)}.map{String($0)}
    let expressList = [["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"],
                       ["-", "*", "+"], ["*", "-", "+"], ["*", "+", "-"]]
    
    var answerList: [Int] = [0]
    for priority in expressList {
        answerList.append(calculate(priority, numbers, express))
    }
    
    return Int64(answerList.max()!)
}
