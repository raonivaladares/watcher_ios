import Foundation
import Domain
import Result

struct WelcomeViewModel {
	private let validationUseCases: Domain.ValidationUseCases
	
	init(validationUseCases: Domain.ValidationUseCases = ValidationUseCases()) {
		self.validationUseCases = validationUseCases
	}
	
	var userToken: String? {
			return validationUseCases.userToken
	}
	
//	func validateUserToken() {
//		validationUseCases.validateUserToken { _ in
//
//		}
//	}
	
	func requestUserToken() {
		validationUseCases.requestUserToken { result in
			
		}
	}
	
	func requestNewSession() {
		validationUseCases.requestUserToken { result in
			
		}
	}
}
