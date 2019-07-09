import Foundation

import Foundation
import DataPlataform
import NetworkPlataform

final class APIConfigurationUseCasesImp: APIConfigurationUseCases {
    private let localDataProvider: LocalDataProvider
    private let apiProvider: ConfigurationNetwork
    
    init(localDataProvider: LocalDataProvider, apiProvider: ConfigurationNetwork) {
        self.localDataProvider = localDataProvider
        self.apiProvider = apiProvider
    }
    
    public func updateLocalConfiguration(completion: @escaping (Result<Void, DomainError>) -> Void) {
        apiProvider.requestConfiguration { result in
            switch result {
            case .success(let APIConfigurationNetworkModel):
                self.localDataProvider
                    .userDefaultsDataProvider
                    .save(APIConfigurationNetworkModel.asDataPlataform())
                completion(.success(()))
            case .failure(_):
                completion(.failure(DomainError.unknow))
            }
        }
    }
    
    public func currentConfiguration() -> APIConfiguration? {
        let configuration: ConfigurarionDataModel? = self.localDataProvider.userDefaultsDataProvider.query()
        return configuration?.asDomain()
    }
}
