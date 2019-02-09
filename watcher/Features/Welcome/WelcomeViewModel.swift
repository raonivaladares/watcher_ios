import Foundation

struct WelcomeViewModel {
    var viewModelError: ViewModelError?
    var isLoading = Changeable(value: false)
    var title = Changeable(value: "")
    var watcherLogoImageName = Changeable(value: "")
    var buttonTitle = Changeable(value: "")
    var tmdbLogoImageName = Changeable(value: "")
    var tmdbDescription = Changeable(value: "")
}

extension WelcomeViewModel {
    enum States {
        case start
        case loading
        case show
        case error(ViewModelError)
    }
    
    init(state: States) {
        switch state {
        case .start:
            title.write(value: "THE \n WATCHER")
            watcherLogoImageName.write(value: "tmdb_logo")
            buttonTitle.write(value: "start")
            tmdbLogoImageName.write(value: "tmdb_logo")
            buttonTitle.write(value: "start")
            tmdbDescription.write(value: "Thanks The Movie DB for the content")
        case .show:
            isLoading.write(value: false)
        case .loading:
            isLoading = Changeable(value: true)
        case .error(let viewModelError):
            isLoading = Changeable(value: false)
            self.viewModelError = viewModelError
        }
    }
}

struct Changeable<T> {
    let hasChanged: Bool
    let value: T
    
    init(hasChanged: Bool = false, value: T) {
        self.hasChanged = hasChanged
        self.value = value
    }
    
    func executeIfChanged(completion: (T) -> Void) {
        if hasChanged {
            completion(value)
        }
    }
    
    mutating func write(value: T) {
        self = Changeable(hasChanged: true, value: value)
    }
}
