import Foundation
import Blake2bC

public struct Blake2b {
    public init() {}
    
    public func computeHash(_ input: [UInt8]) -> [UInt8] {
        let capacity = 28
        let inputPointer = UnsafeMutablePointer<UInt8>.allocate(capacity: input.count)
        let output = UnsafeMutablePointer<UInt8>.allocate(capacity: capacity)
        var pkCopy: [UInt8] = Array(repeating: 0, count: capacity)
        
        for i in 0..<input.count {
            (inputPointer + i).initialize(to: input[i])
        }
        for i in 0..<capacity {
            (output + i).initialize(to: 0)
        }
        
        blake2b(output, capacity, inputPointer, input.count, nil, 0)
        
        for index in 0..<pkCopy.count {
            pkCopy[index] = (output + index).pointee
        }
        
        output.deallocate()
        inputPointer.deallocate()
        
        return pkCopy
    }

}
