import Foundation

public protocol SessionUseCases {
	func requestGuestSession(completion: @escaping (Result<Void, DomainError>) -> Void)
	func isCurrentGuestSessionValid() -> Bool
}
