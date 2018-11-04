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
		
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
	
	private func foo() {}
	
	private func configureNavigationStyle() {
		UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 41/255, green: 46/255, blue: 52/255, alpha: 1)
		UINavigationBar.appearance().tintColor = .textColor//.white
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textColor]
		UINavigationBar.appearance().isTranslucent = false
	
		UINavigationBar.appearance().largeTitleTextAttributes =
		[NSAttributedString.Key.foregroundColor: UIColor.white]
	}
}

extension UIColor {
	class var primaryAppColor: UIColor { return .black }
	class var secundaryAppColor: UIColor { return UIColor(displayP3Red: 41/255, green: 46/255, blue: 52/255, alpha: 1) }
	class var textColor: UIColor { return .white }
}
