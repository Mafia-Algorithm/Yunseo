import Foundation

let city = Int(readLine()!)!
let bus = Int(readLine()!)!

var cityInfo = Array(repeating: Array(repeating: Int.max, count: city+1), count: city+1)

// 자기 자신으로 가는 경로 = 0
(1...city).map{
    cityInfo[$0][$0] = 0
}

// bus로 갈 수 있는 정보 업데이트
for i in 1...bus {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    cityInfo[input[0]][input[1]] = min(cityInfo[input[0]][input[1]], input[2])
}

// 플로이드-워셜
for middle in 1...city {
    for start in 1...city {
        for end in 1...city {
            if cityInfo[start][middle] == Int.max || cityInfo[middle][end] == Int.max { continue }
            cityInfo[start][end] = min(cityInfo[start][end], cityInfo[start][middle] + cityInfo[middle][end])
        }
    }
}

// 출력
cityInfo[1...].map{
    $0[1...].map{$0 == Int.max ? print(0, terminator: " ") : print($0, terminator: " ")}
    print()
}

