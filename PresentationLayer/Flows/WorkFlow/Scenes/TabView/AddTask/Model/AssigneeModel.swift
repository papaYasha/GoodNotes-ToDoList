import Foundation

struct AssigneeModel: Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let email: String
    let image: String
}
