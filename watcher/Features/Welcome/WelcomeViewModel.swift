import Foundation
import Domain
import Result

struct WelcomeViewModel {
	private let validationUseCases: Domain.ValidationUseCases
	
	init(validationUseCases: Domain.ValidationUseCases = ValidationUseCases()) {
		self.validationUseCases = validationUseCases
	}
	
	func requestGuestNewSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {
		validationUseCases.requestGuestSession { result in
			completion(result)
		}
	}
}
