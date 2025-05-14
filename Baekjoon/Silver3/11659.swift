// 11659 - 구간 합 구하기4

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
var arr = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
var sum = Array(repeating: 0, count: N+1)

for i in 1...N {
    sum[i] = sum[i-1] + arr[i]      /// sum[i] = 1부터 i번째 수까지의 합
}

for _ in 0..<M {
    let range = readLine()!.split(separator: " ").map{Int(String($0))!}
    let left = range[0]-1, right = range[1]
    
    print(sum[right] - sum[left])
}
