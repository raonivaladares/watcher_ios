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
//        let controller = ApplicationSplashController(useCases: useCasesFactory.configuration, completion: { _ in })
//        rootNavigation.setViewControllers([controller.viewController], animated: true)
        window.rootViewController = rootNavigation
        let coordinator = ApplicationSplashCoordinator(navigationController: rootNavigation, useCasesFactory: useCasesFactory)
        coordinator.start()
        window.makeKeyAndVisible()
    }
}

final class ApplicationSplashCoordinator {
    private let navigationController: UINavigationController
    private var controller: ApplicationSplashController! = nil
    private let useCasesFactory: UseCasesFactory
    
    init(navigationController: UINavigationController, useCasesFactory: UseCasesFactory) {
        self.navigationController = navigationController
        self.useCasesFactory = useCasesFactory
        
        controller = ApplicationSplashController(useCases: useCasesFactory.configuration) { event in
            switch event {
            case .configurationCompleted:
                self.pushWelcomeCoordinator()
            }
        }
    }
    
    private func pushWelcomeCoordinator () {
        let coordinator = WelcomeCoordinator(navigationController: navigationController, useCasesFactory: useCasesFactory)
        coordinator.start()
    }
    
    func start() {
        navigationController.pushViewController(controller.viewController, animated: true)
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
                print("configurationCompleted")
            }
        }
    }
    
    func start() {
        navigationController.present(controller.viewController, animated: true, completion: nil)
//        navigationController.pushViewController(controller.viewController, animated: true)
    }
}
