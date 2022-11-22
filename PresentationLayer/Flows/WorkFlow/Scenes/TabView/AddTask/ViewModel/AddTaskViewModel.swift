import Foundation
import Combine

class AddTaskViewModel: ObservableObject {
    
    var addTaskButtonTappedsubject = PassthroughSubject<Void, Never>()
    var addQuickNoteTappedsubject = PassthroughSubject<Void, Never>()
    var addCheckListTappedsubject = PassthroughSubject<Void, Never>()
    var showCompleteTaskSubject = PassthroughSubject<Void, Never>()
    
    func didTapAddTaskButton() {
        addTaskButtonTappedsubject.send()
    }
    
    func didTapQuickNoteButton() {
        addQuickNoteTappedsubject.send()
    }
    
    func didTapCheckListButton() {
        addCheckListTappedsubject.send()
    }

    func didTapShowCompleteTaskButton() {
        showCompleteTaskSubject.send()
    }
}
