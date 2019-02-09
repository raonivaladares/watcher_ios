import Quick
import Nimble

@testable import watcher

final class ApplicationSplashControllerSpecs: QuickSpec {
    override func spec() {
        
        describe("init") {
            let controller = ApplicationSplashController()
            it("returns viewController type") {
                expect(controller.viewController).to(beAnInstanceOf(ApplicationSplashViewController.self))
            }
        }
        
        describe("Retain cycle") {
            var controller: ApplicationSplashController? = ApplicationSplashController()
            weak var weakReference = controller
            it("releases all references") {
                controller = nil
                expect(weakReference).to(beNil())
            }
        }
    }
}

