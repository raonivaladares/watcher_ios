import Foundation

final class SearchMovieController {
    let viewController: SearchMovieViewController
    
    init() {
        viewController = SearchMovieViewController()
        
        viewController.viewActionsHandler = { viewAction in
            switch viewAction {
            case .seeDetails:
                print("ok")
            }
        }
    }
}
