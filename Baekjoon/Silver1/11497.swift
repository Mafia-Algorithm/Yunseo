// 11497 - 통나무 건너뛰기(1초, 256MB)
// 통나무 최대 1만개 O(N^2) 가능 ?

// 정렬해서 최소값 기준으로 양 옆에 다음 통나무 붙이면 됨
// 한 번 순회하면서 난이도 구하기

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    let logs = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted{ $0 < $1 }

    var level = logs[1] - logs[0]
    for i in 0..<N-2 {
        let temp = logs[i+2] - logs[i]
        if level < temp { level = temp }
    }
    
    level = max(logs[N-1] - logs[N-2], level)
    print(level)
}


// 원소가 홀수일 때
//0, 1, 2, 3, 4, 5, 6, 7, 8
//통나무 배치: 7 5 3 1 0 2 4 6 8
//0, 1
//0 ,2
//1, 3
//2, 4
//3, 5
//4, 6
//5, 7
//6, 8
//7, 8

// 원소가 짝수일 때
//통나무 배치: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
//9 7 5 3 1 0 2 4 6 8
//0, 1
//0, 2
//1, 2
//2, 4
//3, 5
//4, 6
//5, 7
//6, 8
//7, 9
//8, 9

// 0은 1, 2와 비교, 이후 다다음 통나무 높이와 비교
// N, N-1은 항상 비교

