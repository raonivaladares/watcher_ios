import Foundation
import Domain
import NetworkPlataform
import Result

struct WelcomeViewModel {
	let validationUseCases: ValidationUseCases
	
	init(validationUseCases: ValidationUseCases = ValidationUseCases()) {
		self.validationUseCases = validationUseCases
	}
	
	func registerDevice() {
		validationUseCases.registerDevice { _ in
			
		}
	}
	
	func deviceToken() -> String? {
		return validationUseCases.deviceToken
	}
}

struct ValidationUseCases {
	private let localDataProvider: LocalDataProvider
	
	var deviceToken: String? {
		return localDataProvider.deviceToken?.token
	}
	
	init() {
		localDataProvider = LocalDataProvider()
	}
	
	func registerDevice(completion: (Result<Void, ServerError>) -> Void) {//TODO: ViewModelError
		APIProvider().makeTokenNetwork().requestUserToken() { result in
			print(result)
			
			if let deviceToken = result.value {
				self.localDataProvider.deviceToken = deviceToken
			}
		}
	}
}

class LocalDataProvider {
	var deviceToken: RequestToken?
}
