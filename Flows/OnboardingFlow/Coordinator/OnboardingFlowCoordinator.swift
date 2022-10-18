import UIKit
import SwiftUI

class OnboardingFlowCoordinator {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let view = UIHostingController(rootView: Onboarding())
        navigationController?.pushViewController(view, animated: false)
    }
}
