import Foundation
import Domain
import NetworkPlataform
import Result

struct ValidationUseCases: Domain.ValidationUseCases {
	private let localDataProvider: LocalDataProvider
	private let apiProvider: APIProvider
	
	init() {
		localDataProvider = LocalDataProvider()
		apiProvider = APIProvider()
	}
	
	func requestGuestSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {//
		apiProvider.guestSessionNetwork().requestGuestSessionToken { result in
			if let session = result.value {
				self.localDataProvider.session = session
			}
			completion(result.bimap(success: { _ in }, failure: { _ in ViewModelError(title: "a", message: "aaa") }))
//			completion(result.map { $0 }.mapError(ViewModelError.init))
		}
	}
	
	func isCurrentGuestSessionValid() -> Bool {
		if let session = localDataProvider.session {
			let now = Date()
			return session.expiresAt <= now
		}
		return false
	}
}

class LocalDataProvider {
	var session: GuestSession?
}
