//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 강윤서 on 2/24/24.
//

// 6588 - 골드바흐의 추측

import Foundation

// true/false로 판별
var prime = Array(repeating: true, count: 1000000 + 1)

for i in 2...1000000 {
    var temp = 2
    while temp * i < 1000000 {
        prime[temp*i] = false
        temp += 1
    }
}

while true {
    let input = Int(readLine()!)!
    var flag = true
    if input == 0 {
        break
    }
    for i in 3..<(input/2) + 1 {                // 약수의 합 절반까지만 보면 됨
        if prime[i] {
            let anotherPrime = input - i
            if prime[anotherPrime] {
                print(input, "=", i, "+", anotherPrime)
                flag = false                    // 불가능 flag
                break
            }
        }
    }
    if flag {
        print("Goldbach's conjecture is wrong.")
    }
}
