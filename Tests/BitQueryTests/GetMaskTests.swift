import XCTest
@testable import BitQuery

final class GetMaskTests: XCTestCase {
    let data = Data([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x55, 0xFF])

    func testGetMask() {
        XCTAssertEqual(getMask(bitStart: 0, len: 8), 0b11111111)
        XCTAssertEqual(getMask(bitStart: 0, len: 8), 0b11111111)
        XCTAssertEqual(getMask(bitStart: 2, len: 3), 0b00011100)
        XCTAssertEqual(getMask(bitStart: 7, len: 1), 0b10000000)
    }
}
