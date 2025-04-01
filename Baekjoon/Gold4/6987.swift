import Foundation

var array: [Int] = []
var example: [[Int]] = []

func combination(_ index: Int) {
    if array.count == 2 {
        example.append(array)
    }
    
    for i in index..<6 {
        array.append(i)
        combination(i+1)
        _ = array.popLast()
    }
}


func match(index: Int, array: [[Int]], result: Int) -> Bool {
    var array = array
    if index == 15 {
        if array.flatMap({$0}).allSatisfy({ $0 == 0 }) {
            return true
        }
        return false
    }
    if result == 0 {
        // A가 이긴 경우
        array[example[index][0]][0] -= 1
        array[example[index][1]][2] -= 1
        if array[example[index][0]][0] < 0 || array[example[index][1]][2] < 0 {
            return false
        }
    } else if result == 1 {
        // 무승부인 경우
        array[example[index][0]][1] -= 1
        array[example[index][1]][1] -= 1
        if array[example[index][0]][1] < 0 || array[example[index][1]][1] < 0 {
            return false
        }
    } else if result == 2 {
        // A가 패한 경우
        array[example[index][0]][2] -= 1
        array[example[index][1]][0] -= 1
        if array[example[index][0]][2] < 0 || array[example[index][1]][0] < 0 {
            return false
        }
    }
    
    let case1 = match(index: index+1, array: array, result: 0)
    let case2 = match(index: index+1, array: array, result: 1)
    let case3 = match(index: index+1, array: array, result: 2)
    
    return case1 || case2 || case3
}


// 조합 구하기(경기를 하는 경우의 수 구하기)
combination(0)

for _ in 0..<4 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var checkArray: [[Int]] = []
    for j in 0..<6 {
        checkArray.append(Array(input[j*3..<(j+1)*3]))
    }
    
    let case1 = match(index: 0, array: checkArray, result: 0)
    let case2 = match(index: 0, array: checkArray, result: 1)
    let case3 = match(index: 0, array: checkArray, result: 2)
    
    if case1 || case2 || case3 {
        print(1)
    } else {
        print(0)
    }
}
