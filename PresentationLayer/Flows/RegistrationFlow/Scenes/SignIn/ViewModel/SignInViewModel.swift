import Foundation
import Combine

class SignInViewModel: ObservableObject {
    
    @Published var login = ""
    @Published var password = ""
    
    var backButtonTappedSubject = PassthroughSubject<Void, Never>()
    var forgotPasswordButtonTappedSubject = PassthroughSubject<Void, Never>()
    
    func didTapSignInButton() {
        print(#function)
    }
    
    func didTapSignUpButton() {
        print(#function)
    }
    
    func didTapForgotPasswordButton() {
        forgotPasswordButtonTappedSubject.send()
    }
    
    func didTapBackButton() {
        backButtonTappedSubject.send()
    }
}
