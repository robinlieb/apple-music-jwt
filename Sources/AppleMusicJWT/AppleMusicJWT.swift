import Foundation
import SwiftJWT

public struct AppleMusicJWT {
    
    public init() {
    }
    
    public func generateToken(teamId: String, keyId: String, keyFileUrl: URL, exp: TimeInterval = 60 * 60 * 24 * 120) -> String? {
        
        var token: String?
        let header = Header(kid: keyId)
        let claims = AppleMusicJWTClaims(iss: teamId, iat: Date(), exp: Date(timeIntervalSinceNow: exp))
        var jwt = JWT(header: header, claims: claims)
        
        do {
            guard let key = try String(contentsOf: keyFileUrl).data(using: .utf8) else {
                return nil
            }
            token = try jwt.sign(using: .es256(privateKey: key))
        } catch {
            print(error.localizedDescription)
        }
        
        return token
    }
}
