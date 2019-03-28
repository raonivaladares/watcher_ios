import Foundation
import Domain

final class ApplicationSplashController {
    enum Event {
        case configurationCompleted
    }
    
    let viewController: ApplicationSplashViewController
    private let useCases: APIConfigurationUseCases
    private let completion: (Event) -> Void
    
    init(viewController: ApplicationSplashViewController = .init(),
         useCases: APIConfigurationUseCases,
         completion: @escaping (Event) -> Void) {
        
        self.useCases = useCases
        self.viewController = viewController
        self.completion = completion
        
        viewController.viewOutput = { event in
            switch event {
            case .retryButtonTapped:
                self.requestApplicationConfiguration()
            }
        }
        
        requestApplicationConfiguration()
    }
}

extension ApplicationSplashController {
    private func requestApplicationConfiguration() {
        let viewModel = ApplicationSplashViewModel(state: .startLoading)
        viewController.bind(viewModel)
        
        useCases.updateLocalConfiguration { result in
            result.analysis(ifSuccess: { [weak self] _ in
                let viewModel = ApplicationSplashViewModel(state: .endLoading)
                self?.viewController.bind(viewModel)
                self?.completion(.configurationCompleted)
            }, ifFailure: { [weak self] domainError in
                let viewModelError = ViewModelError(error: domainError)
                let viewModel = ApplicationSplashViewModel(state: .error(viewModelError))
                self?.viewController.bind(viewModel)
            })
        }
    }
}
