import Foundation

let p1 = readLine()!.split(separator: " ").map{Int(String($0))!}
let p2 = readLine()!.split(separator: " ").map{Int(String($0))!}
let p3 = readLine()!.split(separator: " ").map{Int(String($0))!}

// 신발끈 공식
let ccw = (p1[0] * p2[1]) + (p2[0] * p3[1]) + (p3[0] * p1[1]) - (p2[0] * p1[1]) - (p3[0] * p2[1]) - (p1[0] * p3[1])

if ccw > 0 {
	print(1)
} else if ccw < 0 {
	print(-1)
} else {
	print(0)
}

