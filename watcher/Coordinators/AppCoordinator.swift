import UIKit
import Domain

struct AppCoordinator {
	var window: UIWindow
	let useCasesFactory = UseCasesFactory()
	
	init(window: UIWindow) {
			self.window = window
	}
	
	func start() {
		let viewModel = WelcomeViewModel(sessionUseCases: useCasesFactory.session)
		let controller = WelcomeViewController(viewModel: viewModel)
		let navigationController = UINavigationController(rootViewController: controller)
		
		UINavigationBar.appearance().barTintColor = .black
		UINavigationBar.appearance().tintColor = .white
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		UINavigationBar.appearance().isTranslucent = false
		
		UINavigationBar.appearance().largeTitleTextAttributes =
			[NSAttributedString.Key.foregroundColor: UIColor.white]
		
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
	
	private func foo() {}
}
