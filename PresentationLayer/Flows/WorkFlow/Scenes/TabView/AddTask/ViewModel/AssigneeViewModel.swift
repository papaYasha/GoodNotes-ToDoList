import Foundation

class AssigneeViewModel: ObservableObject {
    
    @Published var assignees: [AssigneeModel] = [
        AssigneeModel(name: "Stephen Chow", email: "stephenchow18@gmail.com", image: "person.wave.2.fill"),
        AssigneeModel(name: "Stephen Chow", email: "stephenchow18@gmail.com", image: "person.wave.2.fill"),
        AssigneeModel(name: "Stephen Chow", email: "stephenchow18@gmail.com", image: "person.wave.2.fill")
    ]
}
