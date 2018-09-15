import Foundation
import Domain
import Result

struct WelcomeViewModel {
	private let validationUseCases: ValidationUseCases
	
	init(validationUseCases: ValidationUseCases = ValidationUseCasesImp()) {
		self.validationUseCases = validationUseCases
	}
	
	func requestGuestNewSession(completion: @escaping (Result<Void, ViewModelError>) -> Void) {
		validationUseCases.requestGuestSession { result in
			completion(result)
		}
	}
}
