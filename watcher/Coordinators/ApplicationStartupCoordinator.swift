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

final class WelcomeCoordinator {
    private let navigationController: UINavigationController
    private let controller: WelcomeController
    private let useCasesFactory: UseCasesFactory
    
    init(navigationController: UINavigationController, useCasesFactory: UseCasesFactory) {
        self.navigationController = navigationController
        self.useCasesFactory = useCasesFactory
        
        controller = WelcomeController(sessionUseCases: useCasesFactory.session) { event in
            switch event {
            case .confirm:
                SearchMovieCoordinator(navigationController: navigationController, useCasesFactory: useCasesFactory).start()
            }
        }
    }
    
    func start() {
//        navigationController.present(controller.viewController, animated: true, completion: nil)
        navigationController.pushViewController(controller.viewController, animated: true)
    }
}
