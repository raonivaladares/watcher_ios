import UIKit
import Domain

final class SearchMovieCoordinator {
    private let navigationController: UINavigationController
    private let useCasesFactory: UseCasesFactory
    
    init(navigationController: UINavigationController, useCasesFactory: UseCasesFactory) {
        self.navigationController = navigationController
        self.useCasesFactory = useCasesFactory
    }
    
    func start() {
        let controller = SearchMovieController()
        self.navigationController.present(controller.viewController, animated: true)
    }
}
