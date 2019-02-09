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
        
        requestApplicationConfiguration()
    }
}

extension ApplicationSplashController {
    private func requestApplicationConfiguration() {
        let viewModel = ApplicationSplashViewModel(state: .startLoading)
        viewController.bind(viewModel)
        
        useCases.updateLocalConfiguration { result in
            result.analysis(ifSuccess: { [weak self] _ in
//                let viewModel = ApplicationSplashViewModel(state: .endLoading)
                let error = DomainError.unknow
                let viewModel = ApplicationSplashViewModel(state: .error(ViewModelError(error: error)))
                self?.viewController.bind(viewModel)
            }, ifFailure: { [weak self] domainError in
                let viewModelError = ViewModelError(error: domainError)
                let viewModel = ApplicationSplashViewModel(state: .error(viewModelError))
                self?.viewController.bind(viewModel)
            })
        }
    }
}

struct ApplicationSplashViewModel {
    let isLoading: Bool
    let viewModelError: ViewModelError?
    
    enum State {
        case startLoading
        case endLoading
        case error(ViewModelError)
    }
    
    init(state: State) {
        switch state {
        case .startLoading:
            isLoading = true
            viewModelError = nil
        case .endLoading:
            isLoading = false
            viewModelError = nil
        case .error(let viewModelError):
            isLoading = false
            self.viewModelError = viewModelError
        }
    }
}
