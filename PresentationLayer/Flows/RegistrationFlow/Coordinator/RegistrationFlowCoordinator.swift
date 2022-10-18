//import UIKit
//import SwiftUI
//
//class RegistrationFlowCoordinator {
//    
//    var navigationController = UINavigationController()
//    var flowEnd: (() -> Void)?
//
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//
//    func start() {
//        let viewModel = SignInViewModel()
//        let view = UIHostingController(rootView: SignIn(viewModel: viewModel))
//        navigationController.pushViewController(view, animated: false)
//        viewModel.tapped = {
//            self.flowEnd?()
//        }
//    }
//}
