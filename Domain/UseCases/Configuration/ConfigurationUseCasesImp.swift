import Foundation

import Foundation
import DataPlataform
import NetworkPlataform
import Result

final class APIConfigurationUseCasesImp: APIConfigurationUseCases {
    private let localDataProvider: LocalDataProvider
    private let apiProvider: APIProvider
    
    init(localDataProvider: LocalDataProvider, apiProvider: APIProvider) {
        self.localDataProvider = localDataProvider
        self.apiProvider = apiProvider
    }
    
    public func updateLocalConfiguration(completion: @escaping (Result<Void, DomainError>) -> Void) {
        apiProvider.apiConfiguration().requestConfiguration { result in
            completion(result.bimap(success: {
                self.localDataProvider.userDefaultsDataProvider.save($0.asDataPlataform())
                print("\($0)")
                
            }, failure: { _ in DomainError.unknow }))
        }
    }
    
    public func currentConfiguration() -> APIConfiguration? {
        let configuration: ConfigurarionDataModel? = self.localDataProvider.userDefaultsDataProvider.query()
        return configuration?.asDomain()
    }
}
