import Foundation
import Combine

class ForgotPasswordViewModel: ObservableObject {
    
    @Published var email = ""
    var sendRequestButtonTappedSubject = PassthroughSubject<Void, Never>()
    
    func didTapSendRequestButton() {
        sendRequestButtonTappedSubject.send()
    }
}
