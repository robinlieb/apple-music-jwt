import Foundation
import SwiftJWT

struct AppleMusicJWTClaims: Claims {
    let iss: String
    let iat: Date?
    let exp: Date?
}
