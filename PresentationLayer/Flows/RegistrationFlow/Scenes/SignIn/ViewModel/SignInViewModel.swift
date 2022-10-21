import Foundation
import Combine

class SignInViewModel: ObservableObject {
    
    var forgotPasswordTappedSubject = PassthroughSubject<Void, Never>()

    @Published var login = ""
    @Published var password = ""
    
    func didTapSignInButton() {
        print(#function)
    }
    
    func didTapSignUpButton() {
        print(#function)
    }
    
    func didTapForgotPasswordButton() {
        forgotPasswordTappedSubject.send()
    }
}
