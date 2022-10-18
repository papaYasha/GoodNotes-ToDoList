import Foundation

struct SignUpResponseModel: Codable {
    let data: SignUpResponseData
}

struct SignUpResponseData: Codable {
    let id: String
    let email: String
    let username: String
    let avatarUrl: String?
    let userSession: AuthTokenModel
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case username = "username"
        case avatarUrl = "avatar_url"
        case userSession = "user_session"
    }
}

