import UIKit
import SwiftUI
import Combine

class RegistrationFlowCoordinator {
    
    var navigationController = UINavigationController()
    
    var flowEndSubject = PassthroughSubject<Void, Never>()
    var cancelBag = Set<AnyCancellable>()
    
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
            .sink { // [weak self] in
                self.showSignInScene()
            }
            .store(in: &cancelBag)
        
    }
    
    private func showSignInScene() {
        let viewModel = SignInViewModel()
        let view = UIHostingController(rootView: SignIn(viewModel: viewModel))
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(view, animated: true)
        
        viewModel.forgotPasswordButtonTappedSubject
            .sink { [weak self] in
                self?.showForgotPasswordScene()
            }
            .store(in: &cancelBag)
    }
    
    private func showForgotPasswordScene() {
        let viewModel = ForgotPasswordViewModel()
        let view = UIHostingController(rootView: ForgotPassword(viewModel: viewModel))
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(view, animated: true)
        
        viewModel.sendRequestButtonTappedSubject
            .sink { [weak self] in
                self?.showResetPasswordScene()
            }
            .store(in: &cancelBag)
    }
    
    private func showResetPasswordScene() {
        let viewModel = ResetPasswordViewModel()
        let view = UIHostingController(rootView: ResetPassword(viewModel: viewModel))
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(view, animated: true)
        
        viewModel.changePasswordButtonTappedSubject
            .sink { [weak self] in
                self?.showSuccessfulResetScene()
            }
            .store(in: &cancelBag)
    }
    
    private func showSuccessfulResetScene() {
        let viewModel = SuccessfulResetViewModel()
        let view = UIHostingController(rootView: SuccessfulReset(viewModel: viewModel))
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(view, animated: true)
        
        viewModel.tapGestureSubject
            .sink { [weak self] in
                self?.flowEndSubject.send()
            }
            .store(in: &cancelBag)
    }
}
