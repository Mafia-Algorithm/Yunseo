// 5430 - AC

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let r = input[0] - 1, c = input[1] - 1, k = input[2]
var A: [[Int]] = []
var time = 0                                // 경과된 시간

// 입력 값 추가
for _ in 1...3 {
    A.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// 1초간 발생하는 일
while time <= 100 {
    
    // (r, c)가 k인 경우 time 출력, 그렇지 않은 경우 -1 출력
    // r, c의 범위보다 배열이 작아지는 경우 놓침.. 범위 체크
    if r < A.count && c < A[0].count && A[r][c] == k {
        break
    }
    
    time += 1
    
    if rowColCount() {                // 행의 개수가 더 큰 경우
        rowCal()                                // R 연산
    } else {                                // 열의 개수가 더 큰 경우
        colCal()                                // C 연산
    }
    
    // 100 * 100만 남기기
    if A.count > 100 {
        A = Array(A.prefix(100))
    }
    
    if A[0].count > 100 {
        for i in 0..<A.count {
            A[i] = Array(A[i].prefix(100))
        }
    }
}

// 행, 열의 개수를 비교하는 함수
func rowColCount() -> Bool {
    return A.count >= A[0].count
}

// R 연산
func rowCal() {
    var dict: [Int: Int] = [:]
    var maxLength = 0
    for i in 0..<A.count {            // 각 행 확인
        dict = [:]
        for j in 0..<A[i].count where A[i][j] != 0 {                        // 행 별 숫자의 개수 세기
            dict[A[i][j], default: 0] += 1                                  // A[i][j]를 key로 하는 딕셔너리
        }
        
        A[i] = dictToRow(dict)        // 변환된 행 저장
        maxLength = max(maxLength, A[i].count)
    }
    
    
    // 빈 공간 0으로 채우기
    for r in 0..<A.count {
        A[r].append(contentsOf: Array(repeating: 0, count: maxLength - A[r].count))
    }
}

// 행별 숫자 개수 세서 배열로 반환
func dictToRow(_ row: [Int: Int]) -> [Int] {
    let row = row.sorted {                        // 숫자 개수 오름차순, 숫자 오름차순 정렬
        if $0.value == $1.value {
            return $0.key < $1.key
        }
        return $0.value < $1.value
    }
    
    var result: [Int] = []
    
    for (k, v) in row {                                // 숫자-숫자 개수로 배열 생성
        result.append(k)
        result.append(v)
    }
    return result
}

// C 연산 -> 새 배열 생성해서 회전한 다음 업데이트 하는게 적절함
// append를 통해 연산하려고 하면 누락값이 생길 수 있음
func colCal() {
    var dict: [Int: Int] = [:]
    var newA: [[Int]] = []
    var maxLength = 0
    
    for c in 0..<A[0].count {                // 열의 인덱스
        dict = [:]                           // 딕셔너리 초기화
        for r in 0..<A.count where A[r][c] != 0 {                // 행의 인덱스
            dict[A[r][c], default: 0] += 1
        }
        
        let convert = dictToRow(dict)                    // 딕셔너리를 배열로 변경
        newA.append(convert)
        maxLength = max(maxLength, convert.count)        // 세로 줄의 최대 개수 구함
    }
    
    // 개수 맞추기
    for i in 0..<newA.count {
        newA[i].append(contentsOf: Array(repeating: 0, count: maxLength - newA[i].count))
    }
    
    var rotateA: [[Int]] = Array(repeating: Array(repeating: 0, count: newA.count), count: maxLength)
    for i in 0..<newA.count {
        for j in 0..<newA[i].count {
            rotateA[j][i] = newA[i][j]
        }
    }
    A = rotateA
}

// (r, c)가 k인 경우 time 출력, 그렇지 않은 경우 -1 출력
// r, c의 범위보다 배열이 작아지는 경우 놓침.. 범위 체크
if r < A.count && c < A[0].count && A[r][c] == k {
    print(time)
} else {
    print(-1)
}

