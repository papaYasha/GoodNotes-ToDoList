import UIKit
import SwiftUI
import Combine

class RegistrationFlowCoordinator {
    
    var navigationController = UINavigationController()
    
    var flowEndSubject = PassthroughSubject<Void, Never>()
    var cancellables = Set<AnyCancellable>()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("RegistrationFlowCoordinator deinited")
    }

    func start() {
        let viewModel = SignUpViewModel()
        let view = UIHostingController(rootView: SignUp(viewModel: viewModel))
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(view, animated: false)
                
        viewModel.signInButtonTappedSubject
            .sink { [weak self] in
                self?.showSignInScene()
                print("showSignInScene")
            }
            .store(in: &cancellables)
        
    }
    
    private func showSignInScene() {
        let viewModel = SignInViewModel()
        let view = UIHostingController(rootView: SignIn(viewModel: viewModel))
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(view, animated: true)
        
        viewModel.forgotPasswordTappedSubject
            .sink { [weak self] in
                self?.showForgotPasswordScene()
                print("showForgotPasswordScene")
            }
            .store(in: &cancellables)
    }
    
    private func showForgotPasswordScene() {
        let view = UIHostingController(rootView: ForgotPassword())
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(view, animated: true)
    }
}
