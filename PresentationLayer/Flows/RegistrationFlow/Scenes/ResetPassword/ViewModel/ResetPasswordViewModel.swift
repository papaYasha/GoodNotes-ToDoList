import Foundation
import Combine

class ResetPasswordViewModel: ObservableObject {
    
    @Published var resetCode = 0
    @Published var newPassword = ""
    @Published var confirmPassowrd = ""
    
    var changePasswordButtonTappedSubject = PassthroughSubject<Void, Never>()
    
    func changePasswordButtonTapped() {
        changePasswordButtonTappedSubject.send()
    }
    
}
