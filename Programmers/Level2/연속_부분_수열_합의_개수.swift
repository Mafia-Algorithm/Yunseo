import Foundation
// 원형 수열의 연속하는 부분 수열의 합으로 만들 수 있는 수
// 원형 수열의 크기 <= 1000

// 슬라이딩 윈도우, O(n^2)
func solution(_ elements:[Int]) -> Int {
    var circleElements = elements + elements
    var sumSet = Set<Int>()
    
    /// O(n)
    func getSum(_ left: Int, _ right: Int) {
        /// index: 0부터 n개의 합
        var tempSum = circleElements[left...right].reduce(0, +)
        sumSet.insert(tempSum)
        
        var left = left
        var right = right
        
        // 슬라이딩 윈도우로 left, right를 더하고 빼줌, O(n)
        for j in 0..<elements.count {
            left += 1
            right += 1
            tempSum -= circleElements[left]
            tempSum += circleElements[right]
            sumSet.insert(tempSum)
        }
    }
    
    /// O(n)
    for i in 0..<elements.count {
        getSum(0, 0+i)
    }
    
    return sumSet.count
}


/// 방법2) 누적합
/// preSumArray: [i번째 원소까지 더한 누적합]
func solution(_ elements:[Int]) -> Int {
    var sumSet = Set<Int>()
    var preSumArray = Array(repeating: 0, count: elements.count * 2 + 1)
    
    /// 누적합 구함
    for i in 1..<preSumArray.count {
        preSumArray[i] = preSumArray[i-1] + elements[(i-1) % elements.count]
    }
    
    /// count 원소 개수, start에서 시작
    for count in 1...elements.count {
        for start in 0..<elements.count {
            sumSet.insert(preSumArray[start+count] - preSumArray[start])
        }
    }
    
    return sumSet.count
}
