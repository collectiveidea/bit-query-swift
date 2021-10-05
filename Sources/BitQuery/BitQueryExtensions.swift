//
//  BitQueryExtensions.swift
//  
//
//  Created by Chris Rittersdorf on 10/3/21.
//
import Foundation

public protocol BitQueryable {
    func bitQueryData() -> Data
    func getBool(byteIdx: Int, bitStart: Int, len: Int) -> Bool
    func getPercent(byteIdx: Int, bitStart: Int, len: Int, factor: Float) -> Float
    func getUInt8(byteIdx: Int, bitStart: Int, len: Int) -> UInt8
}

extension BitQueryable {
    public func getUInt8(byteIdx: Int, bitStart: Int, len: Int) -> UInt8 {
        BitQuery.getUInt8(data: self.bitQueryData(), byteIdx: byteIdx, bitStart: bitStart, len: len)
    }

    public func getBool(byteIdx: Int, bitStart: Int, len: Int) -> Bool {
        BitQuery.getBool(data: self.bitQueryData(), byteIdx: byteIdx, bitStart: bitStart, len: len)
    }

    public func getPercent(byteIdx: Int, bitStart: Int, len: Int, factor: Float) -> Float {
        BitQuery.getPercent(data: self.bitQueryData(), byteIdx: byteIdx, bitStart: bitStart, len: len, factor: factor)
    }
}

extension Data: BitQueryable {
    public func bitQueryData() -> Data {
        return self
    }
}
