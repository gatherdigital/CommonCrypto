import XCTest
import CommonCrypto

class LibCommonCryptoTests: XCTestCase {
    
  func testExample() {
    let data: Data = "test".data(using: .utf8)!
    var digest = Data(count: Int(CC_MD5_DIGEST_LENGTH))
    _=digest.withUnsafeMutableBytes { digestBytes in
      data.withUnsafeBytes { messageBytes in
        CC_MD5(messageBytes, CC_LONG(data.count), digestBytes)
      }
    }
    let digestString = digest.map{ String(format: "%02x", $0) }.joined()
    XCTAssertEqual(digestString, "098f6bcd4621d373cade4e832627b4f6")
  }
}
