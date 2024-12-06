// 스택 ! !
// replacingOccurrencs 사용하면 N^2이 되어 시간초과 됨

import Foundation

func solution(_ s:String) -> Int{
    var str = s.map{String($0)}
    var strArray: [String] = [str[0]]
    
    for index in 1..<str.count {
        /// strArray가 비어있지 않다면
        if !strArray.isEmpty {
            /// 마지막 원소 == 현재원소
            if strArray.last! == str[index] {
                strArray.removeLast()
            } else {
                strArray.append(str[index])
            }
        } else {
            strArray.append(str[index])
        } 
    }
    
    return strArray.isEmpty ? 1 : 0
}
