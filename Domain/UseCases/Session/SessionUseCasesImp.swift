import Foundation
import NetworkPlataform
import DataPlataform

final class SessionUseCasesImp: SessionUseCases {
	private let localDataProvider: LocalDataProvider
	private let apiProvider: APIProvider
	
	init(localDataProvider: LocalDataProvider, apiProvider: APIProvider) {
		self.localDataProvider = localDataProvider
		self.apiProvider = apiProvider
	}
	
	func requestGuestSession(completion: @escaping (Result<Void, DomainError>) -> Void) {
		apiProvider.guestSessionNetwork().requestGuestSessionToken { result in
            switch result{
            case .success(let guestSessionNetworkModel):
                self.localDataProvider.userDefaultsDataProvider.save(guestSessionNetworkModel.asDataPlataform())
                completion(.success(()))
            case .failure(let error):
                //TODO: Error
                completion(.failure(DomainError.unknow))
            }
		}
	}
	
	func isCurrentGuestSessionValid() -> Bool {
		guard let guestSession: GuestSessionLocalDataModel = localDataProvider.userDefaultsDataProvider.query() else {
			return false
		}
		
		let now = Date()
		return guestSession.expiresAt <= now
	}
}
