import Foundation

func solution(_ new_id:String) -> String {
    
    // 1단계
    let newId = new_id.lowercased()
    
    // 2단계
    var myId = ""
    for n in newId {
        if n.isLetter || n.isNumber || n == "-" || n == "_" || n == "." {
            myId.append(n)
        }
    }
    
    // 3단계
    while myId.contains("..") {
        myId = myId.replacingOccurrences(of: "..", with: ".")
    }
    
    // 4단계
    if myId.hasPrefix(".") {
        myId.removeFirst()
    }
    if myId.hasSuffix(".") {
        myId.removeLast()
    }
    
    // 5단계
    if myId.count == 0 {
        myId = "a"
    }
    
    //6단계
    if myId.count >= 16 {
        let index = myId.index(myId.startIndex, offsetBy: 15)
        myId = String(myId[myId.startIndex..<index])
        if myId.hasSuffix(".") {
            myId.removeLast()
        }
    }
    
    // 7단계
    while myId.count <= 2 {
        myId.append(String(myId.last!))
    }
    
    return myId
}
