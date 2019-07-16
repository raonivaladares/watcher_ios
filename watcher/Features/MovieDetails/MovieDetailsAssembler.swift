import UIKit

final class MovieDetailsAssembler {
    func assemble(with movie: Movie) -> UIViewController {
        let viewController = MovieDetailsViewController()
        let controller = MovieDetailsController(viewController: viewController, movie: movie)
        
        viewController.viewOutputHandler = controller.viewOutputHandler
        
        return viewController
    }
}
