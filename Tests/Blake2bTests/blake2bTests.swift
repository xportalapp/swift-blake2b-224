import XCTest
import Blake2b

final class Blake2bTests: XCTestCase {
    
    func testCorrectDigestForEmptyInput() {
        // given
        let sut = Blake2b()

        // when
        let digest = sut.computeHash([])

        // then
        let expectedDigest: [UInt8] = [
            131, 108, 198, 137, 49, 194, 228,
            227, 232, 56, 96, 46, 202, 25,
            2, 89, 29, 33, 104, 55, 186,
            253, 223, 230, 240, 200, 203, 7
        ]
        XCTAssertEqual(digest, expectedDigest)
    }
    
    func testCorrectDigestForZero() {
        // given
        let sut = Blake2b()

        // when
        let digest = sut.computeHash([0])

        // then
        let expectedDigest: [UInt8] = [
            13, 148, 225, 116, 115, 46, 249,
            170, 231, 63, 57, 90, 180, 69,
            7, 191, 169, 131, 214, 80, 35,
            193, 26, 149, 31, 12, 50, 228
        ]
        XCTAssertEqual(digest, expectedDigest)
    }
    
    func testCorrectDigest() {
        // given
        let sut = Blake2b()

        // when
        let digest = sut.computeHash([0x00, 0x01])

        // then
        let expectedDigest: [UInt8] = [
            148, 48, 190, 29, 94, 55, 234,
            101, 77, 219, 99, 55, 10, 61,
            4, 168, 160, 161, 113, 171, 181,
            195, 113, 10, 155, 195, 114, 248
        ]
        XCTAssertEqual(digest, expectedDigest)
    }
}
