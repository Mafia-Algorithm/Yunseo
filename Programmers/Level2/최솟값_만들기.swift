import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    return zip(A.sorted(by: <), B.sorted(by: >))
    .map{ $0 * $1 }
    .reduce(0, +)
}
