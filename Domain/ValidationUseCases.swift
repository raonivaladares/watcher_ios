import Foundation
import Result

public protocol ValidationUseCases {
	var userToken: String? { get }
	func requestUserToken(completion: (Result<Void, ViewModelError>) -> Void)
	func requestNewSession(completion: (Result<Void, ViewModelError>) -> Void)
}

public struct ViewModelError: Error {
	var title: String
	var message: String
	
	init(title: String, message: String) {
		self.title = title
		self.message = message
	}
}
