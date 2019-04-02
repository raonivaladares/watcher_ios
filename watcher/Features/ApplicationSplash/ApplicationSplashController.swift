import Foundation
import Domain

final class ApplicationSplashController {
    enum Event {
        case configurationCompleted
    }
    
    // MARK: Public properties
    
    let viewController: ApplicationSplashViewController
    
    // MARK: Private properties
    
    private let useCases: APIConfigurationUseCases
    private let completion: (Event) -> Void
    
    // MARK: Inits
    
    init(viewController: ApplicationSplashViewController = .init(),
         useCases: APIConfigurationUseCases,
         completion: @escaping (Event) -> Void) {
        
        self.useCases = useCases
        self.viewController = viewController
        self.completion = completion
        
        viewController.viewOutput = { [weak self] event in
            switch event {
            case .animationFinished:
                self?.completion(.configurationCompleted)
            case .retryButtonTapped:
                self?.requestApplicationConfiguration()
            }
        }
        
        requestApplicationConfiguration()
    }
}

// MARK: Private methods

extension ApplicationSplashController {
    private func requestApplicationConfiguration() {
        let viewModel = ApplicationSplashViewModel(state: .startLoading)
        viewController.bind(viewModel)
        
        useCases.updateLocalConfiguration { result in
            result.analysis(ifSuccess: { [weak self] _ in
                let deadlineTime = DispatchTime.now() + .seconds(2)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                    let viewModel = ApplicationSplashViewModel(state: .endLoading)
                    self?.viewController.bind(viewModel)
                }
            }, ifFailure: { [weak self] domainError in
                let viewModelError = ViewModelError(error: domainError)
                let viewModel = ApplicationSplashViewModel(state: .error(viewModelError))
                self?.viewController.bind(viewModel)
            })
        }
    }
}
