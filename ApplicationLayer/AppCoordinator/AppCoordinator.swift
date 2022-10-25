import UIKit
import SwiftUI
import Combine

class AppCoordinator {

    let window: UIWindow
    let navigationController = UINavigationController()
    var childCoordinators = [Any]()

    
    var cancelBag = Set<AnyCancellable>()

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
        childCoordinators.append(onboardingFlowCoordinator)
        
        onboardingFlowCoordinator.flowEndSubject
            .sink { [weak self] in
                self?.showRegistrationFlow()
            }
            .store(in: &cancelBag)
    }
    
    private func showRegistrationFlow() {
        navigationController.popToRootViewController(animated: false)
        let registrationFlowCoordinator = RegistrationFlowCoordinator(navigationController: navigationController)
        registrationFlowCoordinator.start()
        
        registrationFlowCoordinator.flowEndSubject
            .sink { [weak self] in
                self?.showWorkFlow()
            }
            .store(in: &cancelBag)
    }
    
    private func showWorkFlow() {
        navigationController.popToRootViewController(animated: false)
        let workFlow = WorkFlowCoordinator(navigationController: navigationController)
        workFlow.start()
    }
}
