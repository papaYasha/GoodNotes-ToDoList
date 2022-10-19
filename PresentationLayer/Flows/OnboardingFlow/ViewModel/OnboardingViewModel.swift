import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    
    var onTapSubject = PassthroughSubject<Void, Never>()
        
    func didTapGetStartedButton() {
        onTapSubject.send()
    }
}
