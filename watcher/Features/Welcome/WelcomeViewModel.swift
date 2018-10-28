import Foundation
import Domain
import Result

struct WelcomeViewModel {
	private let sessionUseCases: SessionUseCases
	
	init(sessionUseCases: SessionUseCases) {
		self.sessionUseCases = sessionUseCases
	}
	
	func requestGuestNewSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {
		sessionUseCases.requestGuestSession { result in
			completion(result)
		}
	}
}
