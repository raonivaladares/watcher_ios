import Quick
import Nimble

@testable import watcher

final class ApplicationSplashControllerSpecs: QuickSpec {
    override func spec() {
        
        describe("init") {
            let controller = ApplicationSplashController(useCases: UseCaseStub(), completion: { _ in })
            it("returns viewController type") {
                expect(controller.viewController).to(beAnInstanceOf(ApplicationSplashViewController.self))
            }
        }
        
        describe("Retain cycle") {
            var controller: ApplicationSplashController? = ApplicationSplashController(useCases: UseCaseStub(), completion: { _ in })
            weak var weakReference = controller
            it("releases all references") {
                controller = nil
                expect(weakReference).to(beNil())
            }
        }
    }
}

import Domain
private class UseCaseStub: APIConfigurationUseCases {
    func updateLocalConfiguration(completion: @escaping (Result<Void, DomainError>) -> Void) {
        
    }
    
    
}
