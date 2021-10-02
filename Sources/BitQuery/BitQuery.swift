import Foundation

let bitMasks: [UInt8] = [
     0b00000000,
     0b00000001,
     0b00000011,
     0b00000111,
     0b00001111,
     0b00011111,
     0b00111111,
     0b01111111,
     0b11111111
 ]

public func getMask(bitStart: Int, len: Int) -> UInt8 {
    return (bitMasks[len] << bitStart)
}
}
