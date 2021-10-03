import Foundation
import XCTest
@testable import BitQuery

final class BitQueryExtensionsTest: XCTestCase {
    func testExtensionsGetUInt8() {
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x55, 0xFF, 0b10000000])
        XCTAssertEqual(data.getUInt8(byteIdx: 6, bitStart: 2, len: 3), 0b00000101)
    }
    
    func testExtensionsGetBool() {
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x55, 0xFF])
        XCTAssertEqual(data.getBool(byteIdx: 6, bitStart: 0, len: 1), true)
        XCTAssertEqual(data.getBool(byteIdx: 6, bitStart: 1, len: 1), false)
        XCTAssertEqual(data.getBool(byteIdx: 6, bitStart: 2, len: 3), true)
        XCTAssertEqual(data.getBool(byteIdx: 7, bitStart: 0, len: 8), true)
        XCTAssertEqual(data.getBool(byteIdx: 5, bitStart: 3, len: 2), false)
        XCTAssertEqual(data.getBool(byteIdx: 5, bitStart: 2, len: 2), true)
    }
    
    func testExtensionsGetPercent() {
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x55, 0xFF, 0x80])
        
        XCTAssertEqual(data.getPercent(byteIdx: 1, bitStart: 0, len: 8, factor: 0.5), 0.5)
        XCTAssertEqual(data.getPercent(byteIdx: 2, bitStart: 0, len: 8, factor: 1.0), 2.0)
        XCTAssertEqual(data.getPercent(byteIdx: 7, bitStart: 0, len: 8, factor: 0.2), 51.0)
        XCTAssertEqual(data.getPercent(byteIdx: 8, bitStart: 0, len: 8, factor: 0.5), 64.0)
        XCTAssertEqual(data.getPercent(byteIdx: 6, bitStart: 0, len: 1, factor: 0.25), 0.25)
        XCTAssertEqual(data.getPercent(byteIdx: 6, bitStart: 1, len: 1, factor: 0.75), 0.0)
        XCTAssertEqual(data.getPercent(byteIdx: 6, bitStart: 2, len: 3, factor: 0.5), 2.5)
        XCTAssertEqual(data.getPercent(byteIdx: 7, bitStart: 0, len: 8, factor: 0.9), 229.5)
    }
}
