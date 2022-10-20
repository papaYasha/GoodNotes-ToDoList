import UIKit
import SwiftUI

class RegistrationFlowCoordinator {
    
    var navigationController = UINavigationController()
    var flowEnd: (() -> Void)?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = SignUpViewModel()
        let view = UIHostingController(rootView: SignUp(viewModel: viewModel))
        navigationController.pushViewController(view, animated: false)
    }
    
    func showSignIn() {
        let viewModel = SignInViewModel()
        let view = UIHostingController(rootView: SignIn(viewModel: viewModel))
        navigationController.pushViewController(view, animated: false)
    }
}
