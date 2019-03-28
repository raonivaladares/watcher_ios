import Foundation

import Foundation
import DataPlataform
import NetworkPlataform
import Result

final class APIConfigurationUseCasesImp: APIConfigurationUseCases {
    private let localDataProvider: LocalDataProvider
    private let apiProvider: ConfigurationNetwork
    
    init(localDataProvider: LocalDataProvider, apiProvider: ConfigurationNetwork) {
        self.localDataProvider = localDataProvider
        self.apiProvider = apiProvider
    }
    
    public func updateLocalConfiguration(completion: @escaping (Result<Void, DomainError>) -> Void) {
        apiProvider.requestConfiguration { result in
            
            let deadlineTime = DispatchTime.now() + .seconds(5)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                completion(result.bimap(success: {
                    self.localDataProvider.userDefaultsDataProvider.save($0.asDataPlataform())
                    
                }, failure: { _ in DomainError.unknow }))
            }
        }
    }
    
    public func currentConfiguration() -> APIConfiguration? {
        let configuration: ConfigurarionDataModel? = self.localDataProvider.userDefaultsDataProvider.query()
        return configuration?.asDomain()
    }
}
