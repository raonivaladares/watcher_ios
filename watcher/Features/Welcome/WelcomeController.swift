import Foundation
import Result
import Domain

final class WelcomeController {
    enum Action {
        case confirm
    }
    
    private let sessionUseCases: SessionUseCases
    
    let viewController: WelcomeViewController
    
    init(viewController: WelcomeViewController = .init(),
        sessionUseCases: SessionUseCases,
        completion: (Action) -> Void) {
        
        self.viewController = viewController
        self.sessionUseCases = sessionUseCases
        
        bindViewModel()
        viewController.viewActionsHandler = { viewAction in
            switch viewAction {
            case .confirmed:
                let viewModel = WelcomeViewModel(state: .loading)
                viewController.bind(viewModel)
                print(".loading")
                self.requestGuestNewSession { result in
                    result.analysis(ifSuccess: { _ in
                        let viewModel = WelcomeViewModel(state: .show)
                        viewController.bind(viewModel)
                        print(".show")
                    }, ifFailure: { viewModelError in
                        let viewModel = WelcomeViewModel(state: .error(viewModelError))
                        viewController.bind(viewModel)
                    })
                }
            }
        }
    }
    
    private func bindViewModel() {
        let viewModel = WelcomeViewModel(state: .show)
        viewController.bind(viewModel)
    }
    
    func requestGuestNewSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {
        sessionUseCases.requestGuestSession { result in
            completion(result.map { $0 }.mapError(ViewModelError.init))
        }
    }
}
