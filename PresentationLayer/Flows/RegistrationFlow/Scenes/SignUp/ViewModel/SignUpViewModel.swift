import UIKit
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var login = "nikita@gmail.com"
    @Published var loginValidation = false
    @Published var passwordValidation = false
    @Published var password = "qwertY2020"
    @Published var validation = false
    let restTemplate = RestTemplate.INSTANCE
    var tapped: (() -> Void)?
    
    func didTapSignUpButton() {
        loginValidation = ValidationUtil.validateLogin(login)
        passwordValidation = ValidationUtil.validatePassword(password)
        if loginValidation && passwordValidation {
            print("ok, show next flow")
            let signUpRequest = SignUpRequestModel(email: login, username: usernameFromEmail(email: login), password: Data(password.utf8).base64EncodedString())
            restTemplate.post(url: Constants.signUpUrl, body: signUpRequest, decodeTo: SignUpResponseModel.self) { [weak self] responseData in
                print(responseData.data.username)
//                self?.tapped?()
            }
        } else {
            print("password or login are not valid")
        }
    }
    
    func didTapSignInButton() {
        
    }
    
    
    
    private func usernameFromEmail(email: String) -> String {
        let username = email.components(separatedBy: "@")[0]
        return username
    }
    
    deinit {
        print("deinited")
    }
}
