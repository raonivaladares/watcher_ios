import Foundation

struct WelcomeViewModel {
    let viewModelError: ViewModelError?
    let isLoading: Bool
    let title = "THE \n WATCHER"
    let watcherLogoImageName = "tmdb_logo"
    let buttonTitle = "start"
    let tmdbLogoImageName = "tmdb_logo"
    let tmdbDescription  = "Thannks The Movie DB for the content"
}

extension WelcomeViewModel {
    init(state: WelcomeViewController.States) {
        switch state {
        case .show:
            self.viewModelError = nil
            isLoading = false
        case .loading:
            self.viewModelError = nil
            isLoading = true
        case .error(let viewModelError):
            isLoading = false
            self.viewModelError = viewModelError
        }
    }
}
