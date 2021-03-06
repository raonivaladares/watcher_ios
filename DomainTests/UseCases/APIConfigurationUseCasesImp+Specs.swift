import Quick
import Nimble
import NetworkPlataform
import DataPlataform

@testable import Domain

final class APIConfigurationUseCasesImpSpecs: QuickSpec {
    override func spec() {
        describe("APIConfigurationUseCasesImpSpecs") {
            context("when currentConfiguration is used after Initialization") {
                let apiConfigurationNetworkModelImages = APIConfigurationNetworkModel.Images(secureBaseURL: "teste", backDropSizes: ["sizeM", "sizeB"])
                let apiConfigurationNetworkModel = APIConfigurationNetworkModel(images: apiConfigurationNetworkModelImages                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                )
                let apiProviderMock = ConfigurationNetworkMock(result: .success(apiConfigurationNetworkModel))
                let userDefaultsMock = UserDefaultsMock()
                let localDataProviderMock = LocalDataProviderImp(userDefaultsDataProvider: userDefaultsMock)
                let useCases = APIConfigurationUseCasesImp(localDataProvider: localDataProviderMock, apiProvider: apiProviderMock)
                
                it("returns nil") {
                    let result = useCases.currentConfiguration()
                    expect(result).to(beNil())
                }
            }
            
            context("when it updates with success") {
                let apiConfigurationNetworkModelImages = APIConfigurationNetworkModel.Images(secureBaseURL: "teste", backDropSizes: ["sizeM", "sizeB"])
                let apiConfigurationNetworkModel = APIConfigurationNetworkModel(images: apiConfigurationNetworkModelImages)
                let apiProviderMock = ConfigurationNetworkMock(result: .success(apiConfigurationNetworkModel))
                let userDefaultsMock = UserDefaultsMock()
                let localDataProviderMock = LocalDataProviderImp(userDefaultsDataProvider: userDefaultsMock)
                let useCases = APIConfigurationUseCasesImp(localDataProvider: localDataProviderMock, apiProvider: apiProviderMock)
                
                it("returns a configuration") {
                    useCases.updateLocalConfiguration { result in
                        expect(try? result.get()).toNot(beNil())
                        
                    }
                }
                
                it("saves new configuration on local data") {
                    useCases.updateLocalConfiguration { _ in }
                    let result = useCases.currentConfiguration()
                    expect(result).toNot(beNil())
                }
            }
            
            context("when it fails to update") {
                let apiProviderMock = ConfigurationNetworkMock(result: .error(ServerError.unkown))
                let userDefaultsMock = UserDefaultsMock()
                let localDataProviderMock = LocalDataProviderImp(userDefaultsDataProvider: userDefaultsMock)
                let useCases = APIConfigurationUseCasesImp(localDataProvider: localDataProviderMock, apiProvider: apiProviderMock)
                
                it("returns a configuration") {
                    useCases.updateLocalConfiguration { result in
                        var error: Error?
                        if case .failure(let domainError) = result {
                            error = domainError
                        }
                        expect(error).toNot(beNil())
                    }
                }
                
                it("saves new configuration on local data") {
                    useCases.updateLocalConfiguration { _ in }
                    let result = useCases.currentConfiguration()
                    expect(result).to(beNil())
                }
            }
        }
    }
}

final class UserDefaultsMock: UserDefaultsDataProvider {
    var model: Any?
    
    func save<T: Codable>(_ model: T) {
        self.model = model
    }
    
    func delete<T: Codable>(_ modelType: T.Type) {
        model = nil
    }
    
    func query<T: Codable>() -> T? {
        return model as? T
    }
}

private final class ConfigurationNetworkMock: ConfigurationNetwork {
    enum ExpectedResult {
        case success(APIConfigurationNetworkModel)
        case error(ServerError)
    }
    
    private let result: ExpectedResult
    
    init(result: ExpectedResult) {
        self.result = result
    }
    
    func requestConfiguration(completion: @escaping (Result<APIConfigurationNetworkModel, ServerError>) -> Void) {
        switch result {
        case .success(let model):
            completion(.success(model))
        case .error(let error):
            completion(.failure(error))
        }
    }
}
