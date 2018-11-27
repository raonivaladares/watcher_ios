import Foundation
import NetworkPlataform
import DataPlataform

public struct UseCasesFactory {
	private let localDataProvider: LocalDataProvider
	private let apiProvider: APIProvider
	
	public init() {
		self.localDataProvider = LocalDataProvider()
		self.apiProvider = APIProvider()
	}
	
	public var session: SessionUseCases {
		return ValidationUseCasesImp(localDataProvider: localDataProvider, apiProvider: apiProvider)
	}
}
