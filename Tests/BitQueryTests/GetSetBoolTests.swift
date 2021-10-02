import XCTest
@testable import BitQuery

final class GetSetBoolTests: XCTestCase {

    let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x55, 0xFF])

    func testGetBoolWholeByte() {
        XCTAssertEqual(getBool(data: self.data, byteIdx: 1, bitStart: 0, len: 8), true)
        XCTAssertEqual(getBool(data: self.data, byteIdx: 2, bitStart: 0, len: 8), true)
        XCTAssertEqual(getBool(data: self.data, byteIdx: 7, bitStart: 0, len: 8), true)
        XCTAssertEqual(getBool(data: self.data, byteIdx: 0, bitStart: 0, len: 8), false)
    }

    func testGetBoolPartialByte() {
        XCTAssertEqual(getBool(data: self.data, byteIdx: 6, bitStart: 0, len: 1), true)
        XCTAssertEqual(getBool(data: self.data, byteIdx: 6, bitStart: 1, len: 1), false)
        XCTAssertEqual(getBool(data: self.data, byteIdx: 6, bitStart: 2, len: 3), true)
        XCTAssertEqual(getBool(data: self.data, byteIdx: 7, bitStart: 0, len: 8), true)
        XCTAssertEqual(getBool(data: self.data, byteIdx: 5, bitStart: 3, len: 2), false)
        XCTAssertEqual(getBool(data: self.data, byteIdx: 5, bitStart: 2, len: 2), true)
    }
    
// TODO: Implement set functions from the Python spec
//    def test_set_bool_whole_byte(self):
//        data = bytearray([0x00, 0x00])
//        set_bool(data, true, 1, 3, 2)
//        XCTAssertEqual(
//            data,
//            bytearray([0x00, 0b00001000]))
//
//    def test_set_bool_keeps_other_bits(self):
//        data = bytearray([0x00, 0xff])
//        set_bool(data, true, 1, 3, 2)
//        XCTAssertEqual(
//            data,
//            bytearray([0x00, 0b11101111]))
//
//    def test_set_bool_multiple(self):
//        data = bytearray([0x00, 0xff])
//        set_bool(data, true, 1, 0, 2)
//        set_bool(data, false, 1, 2, 2)
//        set_bool(data, true, 1, 4, 3)
//        XCTAssertEqual(
//            data,
//            bytearray([0x00, 0b10010001]))
}
