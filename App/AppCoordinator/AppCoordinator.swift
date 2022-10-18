import UIKit
import SwiftUI

class AppCoordinator {

    let window: UIWindow
    let navigationController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
    }

    func start() {
        print("show screen")
//        showAddTask()
//        showNoteListView()
//        if Constants.isAuth {
//            showRegistrationFlow()
//        } else {
//            showOnboardingFlow()
//        }
    }
//
//    private func showOnboardingFlow() {
//        let onboardingFlowCoordinator = OnboardingFlowCoordinator(navigationController: navigationController)
//        onboardingFlowCoordinator.start()
//    }
//
//    private func showRegistrationFlow() {
//        let registrationFlowCoordinator = RegistrationFlowCoordinator(navigationController: navigationController)
//        registrationFlowCoordinator.start()
//        registrationFlowCoordinator.flowEnd = {
//            self.showWorkListFlow()
//        }
//    }
//
//    private func showWorkListFlow() {
//        navigationController.popToRootViewController(animated: false)
//        let workListFlowCoordinator = WorkListFlowCoordinator(root: navigationController)
//        navigationController.isNavigationBarHidden = true
//        navigationController.interactivePopGestureRecognizer?.isEnabled = false
//        workListFlowCoordinator.start()
//    }
//
//    private func showMainPage() {
//        let view = UIHostingController(rootView: MainPage())
//        navigationController.pushViewController(view, animated: true)
//    }
//
//    private func showAddTask() {
//        let view = UIHostingController(rootView: AddTask())
//        navigationController.pushViewController(view, animated: true)
//    }
}
