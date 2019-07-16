import UIKit
import Domain

final class SearchMovieCoordinator {
    private let navigationController: UINavigationController
    private let navigationControllerForNewFlow: UINavigationController
    private let controller: SearchMovieController
    private let useCasesFactory: UseCasesFactory
    
    init(navigationController: UINavigationController, useCasesFactory: UseCasesFactory) {
        self.navigationController = navigationController
        self.useCasesFactory = useCasesFactory
        
        let navigationController = UINavigationController()
        controller = SearchMovieController { action in
            switch action {
            case .itemSelected(let movie):
                let viewController = MovieDetailsAssembler().assemble(with: movie)
                navigationController.pushViewController(viewController, animated: true)
            }
        }
        navigationController.viewControllers = [controller.viewController]
        
        navigationControllerForNewFlow = navigationController
    }
    
    func start() {
        self.navigationController.present(navigationControllerForNewFlow, animated: true)
    }
}
