import Foundation

struct TaskModel: Identifiable, Hashable {
    let id = UUID().uuidString
    let title: String
    let time: String
    let isCompleted: Bool
}
