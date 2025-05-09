// 24060 - 알고리즘 수업 - 병합 정렬 1

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]

var arr = readLine()!.split(separator: " ").map{Int(String($0))!}

func mergeSort(_ A: inout [Int], _ p: Int, _ r: Int) {
    if p < r {
        let mid = (p + r) / 2
        mergeSort(&A, p, mid)
        mergeSort(&A, mid + 1, r)
        merge(&A, p, mid, r)
    }
}

var count = 0
func merge(_ A: inout [Int], _ p: Int, _ q: Int, _ r: Int) {
    var i = p
    var j = q + 1
    var temp: [Int] = []
    while (i <= q && j <= r) {          // 범위1: p~q, 범위2: q+1~r
        if A[i] <= A[j] {
            temp.append(A[i])
            i += 1
        } else {
            temp.append(A[j])
            j += 1
        }
    }
    
    while i <= q {
        temp.append(A[i])
        i += 1
    }
    
    while j <= r {
        temp.append(A[j])
        j += 1
    }
    
    i = p
    var t = 0
    
    while t < temp.count {
        A[i] = temp[t]
        count += 1
        
        if count == K {
            print(temp[t])
            exit(0)
        }
        
        i += 1
        t += 1
        
        
    }
}

mergeSort(&arr, 0, N-1)
print(-1)

