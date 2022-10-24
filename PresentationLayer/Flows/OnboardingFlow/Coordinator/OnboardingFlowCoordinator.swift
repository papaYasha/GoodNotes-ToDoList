import UIKit
import SwiftUI
import Combine

class OnboardingFlowCoordinator {
    
    var flowEndSubject = PassthroughSubject<Void, Never>()
    var cancelBag = Set<AnyCancellable>()

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = OnboardingViewModel()
        let view = UIHostingController(rootView: Onboarding(viewModel: viewModel))
        navigationController?.pushViewController(view, animated: false)

        viewModel.onTapSubject
            .sink { [weak self] in
                self?.flowEndSubject.send()
            }
            .store(in: &cancelBag)
    }
}
