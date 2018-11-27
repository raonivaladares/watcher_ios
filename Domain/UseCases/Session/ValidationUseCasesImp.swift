import Foundation
import NetworkPlataform
import DataPlataform
import Result

final class ValidationUseCasesImp: SessionUseCases {
	private let localDataProvider: LocalDataProvider
	private let apiProvider: APIProvider
	
	init(localDataProvider: LocalDataProvider, apiProvider: APIProvider) {
		self.localDataProvider = localDataProvider
		self.apiProvider = apiProvider
	}
	
	func requestGuestSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {
		apiProvider.guestSessionNetwork().requestGuestSessionToken { result in
			if let guestSession = result.value {
//				self.localDataProvider.save(guestSession.asDomain())
			}
			
			completion(result.bimap(success: { _ in }, failure: { _ in ViewModelError(title: "a", message: "aaa") }))
//			completion(result.map { $0 }.mapError(ViewModelError.init))
		}
	}
	
	func isCurrentGuestSessionValid() -> Bool {
//		if let session = localDataProvider.query() {
//			let now = Date()
//			return session.expiresAt <= now
//		}
		return false
	}
}
