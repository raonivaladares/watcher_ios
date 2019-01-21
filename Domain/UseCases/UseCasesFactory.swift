import Foundation
import NetworkPlataform
import DataPlataform

public struct UseCasesFactory {
	private let localDataProvider: LocalDataProvider
	private let apiProvider: APIProvider
	
	public init() {
		self.localDataProvider = LocalDataProviderImp()
		self.apiProvider = APIProvider()
	}
	
	public var session: SessionUseCases {
		return SessionUseCasesImp(localDataProvider: localDataProvider, apiProvider: apiProvider)
	}
    
    public var configuration: APIConfigurationUseCases {
        return APIConfigurationUseCasesImp(localDataProvider: localDataProvider, apiProvider: apiProvider.apiConfiguration())
    }
}
