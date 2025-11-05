// 18310 - 안테나
// 안테나는 집이 위치한 곳에만 설치 가능
// 집 위치가 주어질 때 안테나를 설치할 위치를 선택
// 동일한 위치에 여러 개의 집이 존재할 수 있음

// 어디에 안테나를 설치해야 best practice?
// O(N^2) ? -> 시간 초과
// 안테나 이동 시 이전 위치보다 큰 경우 break ?

// 매번 계산할 필요없이 중간 집을 지나는 순간부터 값이 커짐

import Foundation

let N = Int(readLine()!)!
let house = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted{$0 < $1}

print(house[(house.count - 1) / 2])

// 5일 때
// 1, 2, 3, 4, 5 -> 3
// 5 / 2 = 2 -> house[2] = 3이라 정답

// 4일 때
// 1, 2, 3, 4 -> 2
// 4 / 2 = 2 -> house[2] -> 3이라 오답
// (4 - 1) / 2 = 1 -> house[1] -> 2

