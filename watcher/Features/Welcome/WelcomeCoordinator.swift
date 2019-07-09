import UIKit
import Domain

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
                SearchMovieCoordinator(
                    navigationController: navigationController,
                    useCasesFactory: useCasesFactory
                    ).start()
            }
        }
    }
    
    func start() {
        navigationController.pushViewController(controller.viewController, animated: true)
    }
}
