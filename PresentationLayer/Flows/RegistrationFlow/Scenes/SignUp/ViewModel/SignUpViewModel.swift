import UIKit
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var login = "nikita@gmail.com"
    @Published var loginValidation = false
    @Published var passwordValidation = false
    @Published var password = "qwertY2020"
    @Published var validation = false
    let restTemplate = RestTemplate.INSTANCE
    var signUpButtonTappedSubject = PassthroughSubject<Void, Never>()
    var signInButtonTappedSubject = PassthroughSubject<Void, Never>()
    
    func didTapSignUpButton() {
        loginValidation = ValidationUtil.validateLogin(login)
        passwordValidation = ValidationUtil.validatePassword(password)
        if loginValidation && passwordValidation {
            signUpButtonTappedSubject.send()
        } else {
            print("password or login are not valid")
        }
    }
    
    func didTapSignInButton() {
        signInButtonTappedSubject.send()
    }
    
    private func usernameFromEmail(email: String) -> String {
        let username = email.components(separatedBy: "@")[0]
        return username
    }
    
    deinit {
        print("deinited")
    }
}
