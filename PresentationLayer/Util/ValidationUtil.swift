import Foundation

class ValidationUtil {
    
    private static let loginValidationPredicate = NSPredicate(format: "SELF MATCHES %@ ", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    private static let passwordValidationPredicate = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
    
    private init() {}
    
    static func validateLogin(_ login: String) -> Bool {
        return loginValidationPredicate.evaluate(with: login)
    }
    
    static func validatePassword(_ password: String) -> Bool {
        return passwordValidationPredicate.evaluate(with: password)
    }
}
