import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progresses = progresses
    var speeds = speeds
    var result: [Int] = []
    var check = 0
    
//1. speeds만큼 더하기
    func addSpeeds() {
        for i in 0..<progresses.count {
            progresses[i] += speeds[i]
        }
    }
    // 2. 가장 앞에 있는 task가 100 이상이 되면 반복문 돌며 100이상인 task pop → 이때 speeds 정보도 같이 pop되어야 올바른 연산 가능
    func checkProgress() -> Int {
        var count = 0
        for _ in 0..<progresses.count {
            if progresses[0] >= 100 {
                progresses.removeFirst()
                speeds.removeFirst()
                count += 1
            } else if count != 0 {    //3. 100미만인 task가 나오면 stop 후 1로 돌아가기
                return count
            }
        }
        return count
    }

    while !progresses.isEmpty {
        addSpeeds()
        check = checkProgress()
        if check != 0 {
            result.append(check)
        }
    }
    
    return result
}

//print(solution([95, 95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1, 1]))
//print(solution([1, 1, 50], [100, 2, 1]))



