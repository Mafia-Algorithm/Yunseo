import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let H = input[0], W = input[1], N = input[2], M = input[3]

let rows = (H + N) / (N + 1)            // 올림을 위해 N 더함
let cols = (W + M) / (M + 1)
print(rows * cols)
