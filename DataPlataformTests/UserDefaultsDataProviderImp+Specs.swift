import Quick
import Nimble

@testable import DataPlataform

final class UserDefaultsDataProviderImpSpecs: QuickSpec {
    override func spec() {
        let codable = JSONCodableImp()
        
        describe("UserDefaultsDataProviderImp") {
            describe("init") {
                it("initializes empty") {
                    let userDefaultsMock = UserDefaultsMock()
                    let _ = UserDefaultsDataProviderImp(userDefaults: userDefaultsMock, codable: codable)
                    
                    expect(userDefaultsMock.localStorage.isEmpty).to(beTrue())
                }
            }
            
            describe("save") {
                it("saves model correctly") {
                    let userDefaultsMock = UserDefaultsMock()
                    let userDefaultsDataProvider = UserDefaultsDataProviderImp(userDefaults: userDefaultsMock, codable: codable)
                    let model = ModelStub()
                    
                    userDefaultsDataProvider.save(model)
                    
                    expect(userDefaultsMock.localStorage.count) == 1
                }
            }
            
            describe("query") {
                it("returns model correctly") {
                    let userDefaultsMock = UserDefaultsMock()
                    let userDefaultsDataProvider = UserDefaultsDataProviderImp(userDefaults: userDefaultsMock, codable: codable)
                    let model = ModelStub()
                    
                    userDefaultsDataProvider.save(model)
                    
                    let modelResult: ModelStub? = userDefaultsDataProvider.query()
                    
                    expect(modelResult).toNot(beNil())
                    expect(userDefaultsMock.localStorage.count) == 1
                }
            }
            
            describe("delete") {
                it("deletes model correclty") {
                    let userDefaultsMock = UserDefaultsMock()
                    let userDefaultsDataProvider = UserDefaultsDataProviderImp(userDefaults: userDefaultsMock, codable: codable)
                    let model = ModelStub()
                    
                    userDefaultsDataProvider.save(model)
                    userDefaultsDataProvider.delete(ModelStub.self)
                    
                    expect(userDefaultsMock.localStorage.isEmpty) == true
                }
            }
        }
    }
}

private final class UserDefaultsMock: UserDefaultsAbstraction {
    var localStorage: [String: Data] = [:]
    
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
