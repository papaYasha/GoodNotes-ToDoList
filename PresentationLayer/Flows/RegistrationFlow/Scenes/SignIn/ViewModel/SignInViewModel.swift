import Foundation


class SignInViewModel: ObservableObject {
    
    @Published var login = ""
    @Published var password = ""
    
    func didTapSignInButton() {
        print(#function)
    }
    
    func didTapSignUpButton() {
        print(#function)
    }
}
