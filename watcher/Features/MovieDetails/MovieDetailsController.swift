import Foundation

final class MovieDetailsController {
    let viewController: MovieDetailsViewController
    let movie: Movie
    
    init(viewController: MovieDetailsViewController = .init(),
         movie: Movie) {
        
        self.viewController = viewController
        self.movie = movie
    }
    
    func viewOutputHandler(action: MovieDetailsViewController.Action) {
        
    }
}
