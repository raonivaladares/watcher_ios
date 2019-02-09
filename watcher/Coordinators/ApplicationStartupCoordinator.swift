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
        let controller = ApplicationSplashController(useCases: useCasesFactory.configuration, completion: { _ in })
        rootNavigation.setViewControllers([controller.viewController], animated: true)
        window.rootViewController = rootNavigation
        window.makeKeyAndVisible()
    }
}
