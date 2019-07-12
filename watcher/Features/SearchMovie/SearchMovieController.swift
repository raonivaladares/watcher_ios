import Foundation

final class SearchMovieController {
    enum Action {
        case itemSelected
    }
    let viewController: SearchMovieViewController
    
    init(viewController: SearchMovieViewController = .init(),
         completion: @escaping (Action) -> Void) {
        self.viewController = viewController
        
        viewController.viewActionsHandler = { viewAction in
            switch viewAction {
            case .itemSelected(let item):
                print("item: \(item)")
                completion(.itemSelected)
            }
        }
    }
}
