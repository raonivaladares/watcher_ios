import Foundation
import Result
import Domain

final class WelcomeController {
    enum Action {
        case confirm
    }
    
    private let sessionUseCases: SessionUseCases
    
    let viewController: WelcomeViewController
    
    private let completion: (Action) -> Void
    
    init(viewController: WelcomeViewController = .init(),
        sessionUseCases: SessionUseCases,
        completion: @escaping (Action) -> Void) {
        
        self.viewController = viewController
        self.sessionUseCases = sessionUseCases
        self.completion = completion
        viewController.viewActionsHandler = viewControllerOutputHandler
        
        bindViewModel()
    }
}

extension WelcomeController {
    private func bindViewModel() {
        let viewModel = WelcomeViewModel(state: .start)
        viewController.bind(viewModel)
    }
    
    private func requestGuestNewSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {
        sessionUseCases.requestGuestSession { result in
            completion(result.map { $0 }.mapError(ViewModelError.init))
        }
    }
}

extension WelcomeController {
    private func viewControllerOutputHandler(_ viewAction: WelcomeViewController.ViewActions) {
        switch viewAction {
        case .confirmed:
            let viewModel = WelcomeViewModel(state: .loading)
            self.viewController.bind(viewModel)
            
            self.requestGuestNewSession { result in
                result.analysis(ifSuccess: { _ in
                    let viewModel = WelcomeViewModel(state: .show)
                    self.viewController.bind(viewModel)
                    self.completion(.confirm)
                }, ifFailure: { viewModelError in
                    let viewModel = WelcomeViewModel(state: .error(viewModelError))
                    self.viewController.bind(viewModel)
                })
            }
        }
    }
}
