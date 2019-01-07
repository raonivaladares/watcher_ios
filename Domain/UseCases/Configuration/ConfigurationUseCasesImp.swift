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
    
    public func requestConfiguration(completion: @escaping (Result<Void, DomainError>) -> Void) {
        
    }
}
