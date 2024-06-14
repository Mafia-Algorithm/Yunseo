//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 6/14/24.
//

// 1011 - Fly me to the Alpha Centauri (2초, 512MB)

import Foundation

let TC = Int(readLine()!)!
let step = [-1, 0, 1]

for _ in 0..<TC {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let x = input[0]            // 시작 위치
    let y = input[1]            // 도착 위치
    
    let distance = y - x        // 이동 거리
    var n = 0                   // 이동 횟수
    
    // == 이 아니라 <=를 사용하는 이유
    // 1 2 3 2 1인 경우 1 2 2 2 1도 가능, 1 2 2 1 1도 가능하기 때문이다!!!
    while true {
        if distance <= (n + 1) * n {            // 짝수 번 이동한 경우
            print(n * 2)
            break
        } else if distance <= (n+1)*(n+1) {     // 홀수 번 이동
            print(n * 2 + 1)
            break
        } else {
            n += 1
        }
    }
}

