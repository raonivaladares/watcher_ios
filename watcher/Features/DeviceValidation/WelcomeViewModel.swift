import Foundation
import Domain
import NetworkPlataform
import Result

struct WelcomeViewModel {
	private let validationUseCases: ValidationUseCases
	
	init(validationUseCases: ValidationUseCases = ValidationUseCases()) {
		self.validationUseCases = validationUseCases
	}
	
	var userToken: String? {
			return validationUseCases.userToken
	}
	
	func validateUserToken() {
		validationUseCases.validateUserToken { _ in

		}
	}
	
	func requestUserToken() {
		validationUseCases.requestUserToken { result in
			
		}
	}
}

struct ValidationUseCases {
	private let localDataProvider: LocalDataProvider
	
	var userToken: String? {
		return localDataProvider.deviceToken?.token
	}
	
	init() {
		localDataProvider = LocalDataProvider()
	}
	
	func requestUserToken(completion: (Result<Void, ServerError>) -> Void) {//TODO: ViewModelError
		APIProvider().makeTokenNetwork().requestUserToken() { result in
			print(result)
			
			if let deviceToken = result.value {
				self.localDataProvider.deviceToken = deviceToken
			}
		}
	}
	
	func validateUserToken(completion: (Result<Void, ServerError>) -> Void) {//TODO: ViewModelError
		
	}
}

class LocalDataProvider {
	var deviceToken: RequestToken?
}
