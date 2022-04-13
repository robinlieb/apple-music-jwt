import XCTest
@testable import AppleMusicJWT

final class AppleMusicJWTTests: XCTestCase {
    
    var subject: AppleMusicJWT?
    
    override func setUp() {
        super.setUp()
        self.subject = AppleMusicJWT()
    }
    
    override func tearDown() {
        self.subject = nil
        super.tearDown()
    }
    
    func testSucessfulSign() throws {
        guard let url = Bundle.module.url(forResource: "ec256_key", withExtension: nil) else {
            XCTFail("Could not get URL of key file")
            return
        }
        let jwt = subject?.generateToken(teamId: "12345678", keyId: "87654321", keyFileUrl: url)
        
        XCTAssertNotNil(jwt)
    }
    
    func testWrongKeyFormat() {
        guard let url = Bundle.module.url(forResource: "rsa_key", withExtension: nil) else {
            XCTFail("Could not get URL of key file")
            return
        }
        let jwt = subject?.generateToken(teamId: "12345678", keyId: "87654321", keyFileUrl: url)
        
        XCTAssertNil(jwt)
    }
    
    func testUnsucessfulSign() {
        guard let url = URL(string: "foo") else {
            XCTFail("Could not get URL of key file")
            return
        }
        
        let jwt = subject?.generateToken(teamId: "12345678", keyId: "87654321", keyFileUrl: url)
        
        XCTAssertNil(jwt)
    }
}
