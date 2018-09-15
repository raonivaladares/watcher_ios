import Foundation
import NetworkPlataform
import Result

public struct ValidationUseCasesImp: ValidationUseCases {
	private let localDataProvider: LocalDataProvider
	private let apiProvider: APIProvider
	
	public init() {
		localDataProvider = LocalDataProvider()
		apiProvider = APIProvider()
	}
	
public	func requestGuestSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {
		apiProvider.guestSessionNetwork().requestGuestSessionToken { result in
			if let session = result.value {
				self.localDataProvider.session = session.asDomain()
			}
			
			completion(result.bimap(success: { _ in }, failure: { _ in ViewModelError(title: "a", message: "aaa") }))
//			completion(result.map { $0 }.mapError(ViewModelError.init))
		}
	}
	
public	func isCurrentGuestSessionValid() -> Bool {
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
