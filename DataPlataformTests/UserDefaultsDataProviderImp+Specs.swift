import Quick
import Nimble

@testable import DataPlataform
#warning("Under development")
final class UserDefaultsDataProviderImpSpecs: QuickSpec {
    override func spec() {
        let userDefaultsStub = UserDefaultsStub()
        let codable = JSONCodableImp()
        
        let userDefaultsDataProvider = UserDefaultsDataProviderImp(userDefaults: userDefaultsStub, codable: codable)
        describe("UserDefaultsDataProviderImp") {
            describe("set") {
                it("returns same secureBaseURL") {
                    let model = ModelMock()
                    userDefaultsDataProvider.save(model)
                    let result = userDefaultsStub.data(forKey: String(describing: ModelMock.self))
                    expect(result).toNot(beNil())
                }
            } // set
        }
    }
}

private final class UserDefaultsStub: UserDefaultsAbstraction {
    private var localStorage: [String: Data] = [:]
    
    func set(_ data: Data, forKey key: String) {
        localStorage[key] = data
    }
    
    func removeObject(forKey key: String) {
        localStorage[key] = nil
    }
    
    func data(forKey key: String) -> Data? {
        return localStorage[key]
    }
}

private struct ModelMock: Codable {}
