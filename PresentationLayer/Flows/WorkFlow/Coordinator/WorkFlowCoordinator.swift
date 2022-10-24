import UIKit
import SwiftUI
import Combine

class WorkFlowCoordinator {
    
    var flowEndSubject = PassthroughSubject<Void, Never>()
    var cancelBag = Set<AnyCancellable>()

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let view = UIHostingController(rootView: MainPage())
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(view, animated: false)
    }
}
