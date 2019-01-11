import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var appCoordinator: AppCoordinator!
    

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		RemoteImagesSettingsManager().updateSettings()
        let window = UIWindow(frame: UIScreen.main.bounds)
		appCoordinator = AppCoordinator(window: window)
		appCoordinator.start()
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {}

	func applicationDidEnterBackground(_ application: UIApplication) {}

	func applicationWillEnterForeground(_ application: UIApplication) {}

	func applicationDidBecomeActive(_ application: UIApplication) {}

	func applicationWillTerminate(_ application: UIApplication) {}
}

import Domain
final class RemoteImagesSettingsManager {
    func updateSettings() {
        UseCasesFactory().configuration.updateLocalConfiguration { result in
            result.analysis(ifSuccess: { _ in
                var foo = 2
                print("success")
                
            }, ifFailure: { _ in 
                var foo = 2
                print("fail")
            })
        }
    }
}
