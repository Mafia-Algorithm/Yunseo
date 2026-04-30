import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var used: Set<String> = []
    var before = ""
    for i in 0..<words.count {
        let word = words[i]
        
        if used.contains(word) || word.count == 1 || (i != 0 && before.last! != word.first!) {
            print(i)
            return [i%n + 1, i/n + 1]
        }
        used.insert(word)
        before = word
    }
    
    return [0, 0]
}
