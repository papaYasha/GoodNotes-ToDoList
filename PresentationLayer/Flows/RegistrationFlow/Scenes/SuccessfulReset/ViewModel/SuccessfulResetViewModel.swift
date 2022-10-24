import Foundation
import Combine

class SuccessfulResetViewModel: ObservableObject {
    
    var tapGestureSubject = PassthroughSubject<Void, Never>()
    
    func tapGestureDidTapped() {
        tapGestureSubject.send()
    }
}
