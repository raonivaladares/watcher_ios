import UIKit
import Domain

final class AppCoordinator {
	private let window: UIWindow
    private let rootNavigation: UINavigationController
	private let useCasesFactory = UseCasesFactory()
	
	init(window: UIWindow) {
        self.window = window
        rootNavigation = UINavigationController()
        
	}
	
    private lazy var welcomeCompletion: (WelcomeController.Action) -> Void = { controllerOutput in
        switch controllerOutput {
        case .confirm:
            self.pushSearhController()
        }
    }
    
    private func pushSearhController() {
        let searchCoordinator = SearchCoodinator(navigation: rootNavigation)
        searchCoordinator.start()
    }
    
	func start() {
        let controller = WelcomeController(sessionUseCases: useCasesFactory.session, completion: welcomeCompletion)
        rootNavigation.setViewControllers([controller.viewController], animated: true)
        window.rootViewController = rootNavigation
		window.makeKeyAndVisible()
	}
}
 
extension UIColor {
//	class var primaryAppColor: UIColor { return .black }
//	class var secundaryAppColor: UIColor { return UIColor(displayP3Red: 41/255, green: 46/255, blue: 52/255, alpha: 1) }
//	class var textColor: UIColor { return .white }
}


final class SearchCoodinator {
    let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        
    }
}

final class SearchController {
    let viewController = SearchMovieViewController()
}
