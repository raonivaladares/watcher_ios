import Quick
import Nimble
import NetworkPlataform
import DataPlataform
import Result

@testable import Domain

final class APIConfigurationUseCasesImpSpecs: QuickSpec {
    override func spec() {
        describe("APIConfigurationUseCasesImpSpecs") {
            let apiConfigurationNetworkModelImages = APIConfigurationNetworkModel.Images.init(secureBaseURL: "aaa", backDropSizes: ["aaa", "bbb"])
            let apiConfigurationNetworkModel = APIConfigurationNetworkModel(images: apiConfigurationNetworkModelImages                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                )
            let apiProviderMock = ConfigurationNetworkMock(result: .success(apiConfigurationNetworkModel))
            let userDefaultsMock = UserDefaultsMock()
            let localDataProviderMock = LocalDataProviderImp(userDefaultsDataProvider: userDefaultsMock)
            let useCases = APIConfigurationUseCasesImp(localDataProvider: localDataProviderMock, apiProvider: apiProviderMock)
            describe("?") {
                it("?") {
                   #warning("Under development")
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
