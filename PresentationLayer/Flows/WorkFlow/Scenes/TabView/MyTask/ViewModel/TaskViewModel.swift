import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = [
        TaskModel(title: "Go fishing with Stephen", time: "9:00am", isCompleted: false),
        TaskModel(title: "Meet according with design team", time: "10:00am", isCompleted: false),
        TaskModel(title: "Create snack", time: "10:30am", isCompleted: true),
        TaskModel(title: "Go for a walk with a Doggy", time: "11:00am", isCompleted: true),
        TaskModel(title: "Meet Jane from railway station", time: "12:00am", isCompleted: false),
        TaskModel(title: "Break for lunch", time: "14:00am", isCompleted: false),
        TaskModel(title: "Read the book Zlatan", time: "15:30am", isCompleted: true)
    ]
}
