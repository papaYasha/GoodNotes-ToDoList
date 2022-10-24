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
    
//    func start() {
//        let viewModel = <#viewModel#>
//        let view = UIHostingController(rootView: <#View(viewModel: viewModel)#>)
//        navigationController.isNavigationBarHidden = <#false#>
//        navigationController.pushViewController(view, animated: <#true#>)
//    }
}
