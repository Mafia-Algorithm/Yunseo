// 11005 - 진법 변환2
/// 십진수를 n진법으로 바꿀 때는 String(intValue, radix:) 사용

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
print(String(input[0], radix: input[1], uppercase: true))
