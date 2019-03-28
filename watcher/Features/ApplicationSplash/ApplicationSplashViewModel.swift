import Foundation

struct ApplicationSplashViewModel {
    let isLoading: Bool
    let isRetryButtonHidden: Bool
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
            isRetryButtonHidden = true
            viewModelError = nil
            
        case .endLoading:
            isLoading = false
            isRetryButtonHidden = true
            viewModelError = nil
            
        case .error(let viewModelError):
            isLoading = false
            isRetryButtonHidden = false
            self.viewModelError = viewModelError
        }
    }
}
