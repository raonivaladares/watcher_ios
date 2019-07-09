import UIKit
import Domain

final class ApplicationStartupCoordinator {
    private let window: UIWindow
    private let rootNavigation: UINavigationController
    private let useCasesFactory = UseCasesFactory()
    
    
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        rootNavigation = UINavigationController()
    }
    
    func start() {
        window.rootViewController = rootNavigation
        let coordinator = ApplicationSplashCoordinator(navigationController: rootNavigation, useCasesFactory: useCasesFactory)
        coordinator.start()
        window.makeKeyAndVisible()
    }
}
