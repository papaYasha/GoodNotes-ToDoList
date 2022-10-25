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
        let viewModel = AddTaskViewModel()
        let view = UIHostingController(rootView: MainPage(viewModel: viewModel))
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(view, animated: false)
        
        viewModel.addTaskButtonTappedsubject
            .sink {
                self.showAddTask()
            }
            .store(in: &cancelBag)
    }
    
    private func showAddTask() {
        let viewModel = AddTaskViewModel()
        let view = UIHostingController(rootView: AddTask())
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(view, animated: true)
    }
}
