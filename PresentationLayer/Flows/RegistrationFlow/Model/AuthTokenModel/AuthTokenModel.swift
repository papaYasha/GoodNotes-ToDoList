import Foundation

struct AuthTokenModel: Codable {
    let userId: String?
    let accessToken: String
    let tokenType: String
    let refreshToken: String
    let expiresIn: Int64
    
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case accessToken = "access_token"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
    }
}
