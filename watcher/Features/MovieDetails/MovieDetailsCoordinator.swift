import UIKit
import Domain

final class MovieDetailsCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = MovieDetailsController()
        self.navigationController.present(controller.viewController, animated: true)
    }
}
