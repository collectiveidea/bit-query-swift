import Foundation
import XCTest
@testable import BitQuery

final class GetSetUInt8Tests: XCTestCase {
    let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x55, 0xFF, 0b10000000])

    func testGetIntWholeByte() {
        XCTAssertEqual(getUInt8(data: self.data, byteIdx: 1, bitStart: 0, len: 8), 1)
        XCTAssertEqual(getUInt8(data: self.data, byteIdx: 2, bitStart: 0, len: 8), 2)
        XCTAssertEqual(getUInt8(data: self.data, byteIdx: 7, bitStart: 0, len: 8), 255)
        XCTAssertEqual(getUInt8(data: self.data, byteIdx: 8, bitStart: 0, len: 8), 128)
    }

    func testGetIntPartialByte() {
        XCTAssertEqual(getUInt8(data: self.data, byteIdx: 6, bitStart: 0, len: 1), 0b00000001)
        XCTAssertEqual(getUInt8(data: self.data, byteIdx: 6, bitStart: 1, len: 1), 0b00000000)
        XCTAssertEqual(getUInt8(data: self.data, byteIdx: 6, bitStart: 2, len: 3), 0b00000101)
        XCTAssertEqual(getUInt8(data: self.data, byteIdx: 7, bitStart: 0, len: 8), 255)
    }

// TODO: Implement set functions from the Python spec
//    def test_set_int_whole_byte_of_zeros(self):
//        data = bytearray(8)
//        set_int(data, 255, 0, 0, 8)
//
//        self.assertEqual(
//            data,
//            bytearray([0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))
//
//    def test_set_int_partial_byte_of_zeros(self):
//        data = bytearray(8)
//        set_int(data, 3, 1, 3, 8)
//
//        self.assertEqual(
//            data,
//            bytearray([0x00, 0b00011000, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))
//
//    def test_set_int_keeps_other_data(self):
//        data = bytearray([0x00, 0b10100001, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
//        set_int(data, 3, 1, 3, 3)
//
//        self.assertEqual(
//            data,
//            bytearray([0x00, 0b10011001, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))
//
//        self.assertEqual(
//            get_int(data, 1, 3, 3),
//            3
//        )
//
//        data2 = bytearray([0xFF, 0xFF])
//        set_int(data2, 1, 1, 1, 7)
//        self.assertEqual(
//            data2,
//            bytearray([0xFF, 0b00000011]))
}
