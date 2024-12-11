import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var count = 0
    var maxPriority = priorities.max()!
    var printList: [Int] = []
    printList.append(contentsOf: stride(from: 0, to: priorities.count, by: 1))
    var queue = Array(zip(priorities, printList))

    while true {
        let check = queue.first
        if queue.count == 1 {
            return count + 1
        }
        if check?.0 == maxPriority {
            count += 1
            let popPrint = queue.removeFirst()
            maxPriority = queue.sorted{ $0.0 > $1.0 }.first!.0
            if popPrint.1 == location {
                return count
            }
        } else {
            queue.append(queue.removeFirst())
        }
    }
}
