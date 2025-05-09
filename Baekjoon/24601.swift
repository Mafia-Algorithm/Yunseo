//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 5/9/25.
//

// 24061 - 알고리즘 수업 - 병합 정렬2

import Foundation

func mergeSort(_ arr: inout [Int], _ p: Int, _ r: Int) {
    if p < r {
        let mid = (p + r) / 2
        mergeSort(&arr, p, mid)
        mergeSort(&arr, mid + 1, r)
        merge(&arr, p, mid, r)
    }
}

func merge(_ arr: inout [Int], _ p: Int, _ mid: Int, _ r: Int) {
    var i = p
    var j = mid + 1
    
    var temp: [Int] = []
    while i <= mid && j <= r {
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
    
    while j <= r {
        temp.append(arr[j])
        j += 1
    }
    
    i = p
    var t = 0
    while t < temp.count {
        arr[i] = temp[t]
        count += 1
        
        if count == K {         // K번 변경했을 때 배열 출력
            print(arr.map{String($0)}.joined(separator: " "))
            exit(0)
        }
        i += 1
        t += 1
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], K = input[1]
    
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
mergeSort(&arr, 0, N-1)
var count = 0
print(-1)

