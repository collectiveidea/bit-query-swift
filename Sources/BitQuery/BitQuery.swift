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

public func getUInt8(data: Data, byteIdx: Int, bitStart: Int, len: Int) -> UInt8 {
    let targetByte = data[byteIdx]
    let mask = getMask(bitStart: bitStart, len: len)
    return (mask & targetByte) >> bitStart
}

public func getBool(data: Data, byteIdx: Int, bitStart: Int, len: Int) -> Bool {
    return getUInt8(data: data, byteIdx: byteIdx, bitStart: bitStart, len: len) != 0
}
}
