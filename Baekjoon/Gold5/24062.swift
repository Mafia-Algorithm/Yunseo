// 24062 - 알고리즘 수업 - 병합 정렬3

// A와 B의 값을 정렬 후 매번 비교하면 N * NlogN이 되어 N^2logN으로 시간초과가 발생한다.
// 때문에 for문을 돌며 매번 비교하면 안되고, count 변수를 활용해야 한다.

import Foundation

func mergeSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
    if start < end {
        let mid = (start + end) / 2
        mergeSort(&arr, start, mid)
        mergeSort(&arr, mid + 1, end)
        merge(&arr, start, mid, end)
    }
}

func merge(_ arr: inout [Int], _ start: Int, _ mid: Int, _ end: Int) {
    var i = start
    var j = mid + 1
    
    var temp: [Int] = []
    while i <= mid && j <= end {
        if arr[i] <= arr[j] {
            temp.append(arr[i])
            i += 1
        } else {
            temp.append(arr[j])
            j += 1
        }
    }
    
    while i <= mid {
        temp.append(arr[i])
        i += 1
    }
    
    while j <= end {
        temp.append(arr[j])
        j += 1
    }
    
    i = start
    var t = 0
    
    while t < temp.count {
        if arr[i] == B[i] {     // 이미 같다면 기존에 matchCount를 셀 때 확인했으므로 -1
            matchCount -= 1
        }
        arr[i] = temp[t]        // 값 변경
        if arr[i] == B[i] {     // 값 변경 후 B와 같다면 += 1
            matchCount += 1
        }
        
        if matchCount == N {    // matchCount는 A와 B의 원소가 같은 횟수이므로 1 출력
            print(1)
            exit(0)
        }
        
        i += 1
        t += 1
    }
    
    if matchCount == N {
        print(1)
        exit(0)
    }
}

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int(String($0))!}
var B = readLine()!.split(separator: " ").map{Int(String($0))!}

var matchCount = 0
for i in 0..<N {
    if A[i] == B[i] { matchCount += 1 }
}

// 처음부터 A와 B가 같은 경우 exit(0)을 실행해야 0이 출력되지 않음
if matchCount == N {
    print(1)
    exit(0)
}
mergeSort(&A, 0, N-1)

print(0)
