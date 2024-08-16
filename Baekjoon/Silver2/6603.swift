import Foundation

var temp: [Int] = []
var answer = ""
func combination(_ index: Int, _ target: [Int]) {
	if temp.count == 6 {
		let strTemp = temp.map{String($0)}.joined(separator: " ")
		answer.append("\(strTemp)\n")
		return
	}
	
	for i in index..<target.count {
		temp.append(target[i])
		combination(i+1, target)
		_ = temp.popLast()
	}
}


while true {
	let input = readLine()!.split(separator: " ").map{Int(String($0))!}
	if input[0] == 0 { break }
	
	combination(0, Array(input[1...]))
	print(answer)
	answer = ""
}
