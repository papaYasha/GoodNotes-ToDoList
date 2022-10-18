import Foundation

struct ErrorModel: Codable {
    let data: ErrorData
}

struct ErrorData: Codable {
    let message: String
    let code: Int
}
