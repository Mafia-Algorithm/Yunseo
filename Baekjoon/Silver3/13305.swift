// 13305 - 주유소
// N개의 도시. 리터당 가격
// N <= 100만, 리터 당 가격은 10억 이하
// [5] -2- [2] -3- [4] -1- [1]

// 다음 마을의 리터 당 가격 수 < 현재 마을의 리터 당 가격 수 -> 필요한만큼 구매
// 다음 마을의 리터 당 가격 수 >= 현재 마을의 리터 당 가격 수 -> 다음 마을 이동까지 구매

import Foundation

let N = Int(readLine()!)!
var distances = readLine()!.split(separator: " ").map{Int(String($0))!}
var cities = readLine()!.split(separator: " ").map{Int(String($0))!}

var answer = 0
var cityNum = 0
while cityNum < cities.count-1 {
    // cities[cityNum]: 현재 마을의 가격, cities[cityNum+1]: 다음 마을의 가격
    if cities[cityNum] > cities[cityNum+1] {                // 현재 마을이 더 비싼 경우 필요한만큼 구매
        answer += (distances[cityNum] * cities[cityNum])
        cityNum += 1
    } else {
        let oil = cities[cityNum]                           // 현재 마을의 가격
        while cityNum < cities.count-1 && oil <= cities[cityNum] {  // 현재 마을이 저렴할 때까지 계속 구매
            answer += (distances[cityNum] * oil)
            cityNum += 1
        }
    }
}

print(answer)
