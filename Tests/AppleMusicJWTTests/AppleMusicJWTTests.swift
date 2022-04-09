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
        let pathToKey = self.getPath(to: "ec256_key")
        
        guard let url = URL(string: pathToKey) else {
            XCTFail("Could not get URL of key file")
            return
        }
        let jwt = subject?.generateToken(teamId: "12345678", keyId: "87654321", keyFileUrl: url)
        
        XCTAssertNotNil(jwt)
    }
    
    func testWrongKeyFormat() {
        let pathToKey = self.getPath(to: "rsa_key")
        
        guard let url = URL(string: pathToKey) else {
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
    
    func getPath(to keyFileName: String) -> String {
        var pathToKey = #file
        if pathToKey.hasSuffix("AppleMusicJWTTests.swift") {
            pathToKey = pathToKey.replacingOccurrences(of: "AppleMusicJWTTests.swift", with: "")
        }
        return "file://\(pathToKey)\(keyFileName)"
    }
}
