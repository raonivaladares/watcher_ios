import Foundation
import Domain

final class ApplicationSplashController {
    let viewController: ApplicationSplashViewController
    let useCases: APIConfigurationUseCases
    
    init(viewController: ApplicationSplashViewController = .init(),
         useCases: APIConfigurationUseCases) {
        
        self.useCases = useCases
        self.viewController = viewController
    }
}


