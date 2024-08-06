// 15666 - N과 M(12)
// N개의 자연수 중 M개를 고른 것
// 같은 수 여러번 골라도 됨
// 비내림차순 -> 오름차순

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]
// 숫자의 중복 제거 + 오름차순
var numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
numbers = Array(Set(numbers)).sorted{ $0 < $1 }

var temp: [Int] = []
var answer = ""
func permutation(_ index: Int, _ depth: Int) {
	// M개가 되면 문자열로 변환해서 answer에 append
	if depth == M {
		answer.append("\(temp.map{String($0)}.joined(separator: " "))\n")
		return
	}
	
	for i in index..<numbers.count {
		// temp에 문자가 존재하고 이전 숫자가 현재숫자보다 크면 continue
		// break하는 경우는 1121 같은 경우가 출력되지 않음
		if depth > 0 && temp.last! > numbers[i] {
			continue
		}
		temp.append(numbers[i])
		permutation(index, depth + 1)
		_ = temp.removeLast()
	}
}

permutation(0, 0)
print(answer)

