import XCTest
@testable import BitQuery

final class GetSetPercentTests: XCTestCase {
    let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x55, 0xFF, 0x80])

    func testGetPercentWholeByte() {
        XCTAssertEqual(getPercent(data: self.data, byteIdx: 1, bitStart: 0, len: 8, factor: 0.5), 0.5)
        XCTAssertEqual(getPercent(data: self.data, byteIdx: 2, bitStart: 0, len: 8, factor: 1.0), 2.0)
        XCTAssertEqual(getPercent(data: self.data, byteIdx: 7, bitStart: 0, len: 8, factor: 0.2), 51.0)
        XCTAssertEqual(getPercent(data: self.data, byteIdx: 8, bitStart: 0, len: 8, factor: 0.5), 64.0)
    }

    func testGetPercentPartialByte() {
       XCTAssertEqual(getPercent(data: self.data, byteIdx: 6, bitStart: 0, len: 1, factor: 0.25), 0.25)
       XCTAssertEqual(getPercent(data: self.data, byteIdx: 6, bitStart: 1, len: 1, factor: 0.75), 0.0)
       XCTAssertEqual(getPercent(data: self.data, byteIdx: 6, bitStart: 2, len: 3, factor: 0.5), 2.5)
       XCTAssertEqual(getPercent(data: self.data, byteIdx: 7, bitStart: 0, len: 8, factor: 0.9), 229.5)
    }

    func testConvertForPercent() {
        let result = convertForPercent(value: 125.0, factor: 0.5)

        XCTAssertEqual(
           result,
           250
       )
    }
    
// TODO: Implement set functions from the Python spec
//
//    def test_set_percent_full_byte(self):
//       data = bytearray(1)
//       set_percent(data, 125.0, 0, 0, 8, 0.5)
//       self.assertEqual(
//           data,
//           bytearray([0xFA])
//       )
//
//       data = bytearray(1)
//       set_percent(data, 64.0, 0, 0, 8, 0.5)
//       self.assertEqual(
//           data,
//           bytearray([0x80])
//       )
//
//       data2 = bytearray(1)
//       set_percent(data2, 0.0, 0, 0, 8, 0.5)
//       self.assertEqual(
//           data2,
//           bytearray([0])
//       )
}
