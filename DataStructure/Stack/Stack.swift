import Foundation

public struct Stack<T> {
    private var storage: [T] = []
    public init() {}
    
    @discardableResult
    public mutating func push(_ element: T) -> Bool {
        if self.count() < 8 {
            storage.append(element)
            return true
        }
        return false
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        return storage.popLast()
    }
    
    /// 최상위 원소를 추출
    public func peek() -> T? {
        return storage.last
    }
    
    public func isEmpty() -> Bool {
        return peek() == nil
    }
    
    public func count() -> Int {
        return storage.count
    }
}

/// ExpressibleByArrayLiteral protocol을 채택하여  arrayLiteral로 초기화
extension Stack: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = T
    
    public init(arrayLiteral elements: T...) {
        storage = elements
    }
}

/// 스택의 상태 출력
extension Stack: CustomStringConvertible {
    public var description: String {
        var result = ""
        result.append("---top---\n")
        storage.reversed().forEach {
            result.append("\($0)\n")
        }
        result.append("---------")
        return result
    }
}
