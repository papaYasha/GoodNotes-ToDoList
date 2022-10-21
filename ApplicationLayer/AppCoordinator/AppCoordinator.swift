import UIKit
import SwiftUI
import Combine

class AppCoordinator {

    let window: UIWindow
    let navigationController = UINavigationController()
    
    var cancellable = Set<AnyCancellable>()

    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
    }
    
    deinit {
        print(#function)
    }

    func start() {
        showOnboardingFlow()
    }

    private func showOnboardingFlow() {
        let onboardingFlowCoordinator = OnboardingFlowCoordinator(navigationController: navigationController)
        onboardingFlowCoordinator.start()
        onboardingFlowCoordinator.flowEndSubject
            .sink { [weak self] in
                self?.showRegistrationFlow()
                print(#function)
            }
            .store(in: &cancellable)
    }
    
    private func showRegistrationFlow() {
        navigationController.popToRootViewController(animated: false)
        let registrationFlowCoordinator = RegistrationFlowCoordinator(navigationController: navigationController)
        registrationFlowCoordinator.start()
    }
}
