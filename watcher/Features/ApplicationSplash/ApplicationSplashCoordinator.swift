import UIKit
import Domain

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
