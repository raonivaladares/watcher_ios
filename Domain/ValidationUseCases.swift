import Foundation
import Result

public protocol ValidationUseCases {
//	func requestUserToken(completion: (Result<Void, ViewModelError>) -> Void)
	func requestGuestSession(completion: @escaping (Result<Void, ViewModelError>) -> Void)
	func isCurrentGuestSessionValid() -> Bool
}

public struct ViewModelError: Error {
	var title: String
	var message: String
	
	public init(title: String, message: String) {
		self.title = title
		self.message = message
	}
}
